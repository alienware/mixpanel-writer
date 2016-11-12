defmodule MixpanelWriter.Dedup do
  @moduledoc """
  Deduplicates list of profiles based on a number of profile properties
  """

  @doc """
  Deduplicates list of profiles based on Account ID
  """
  def on_account_id(profiles) do
    on_account_id(profiles, [])
  end

  def on_account_id([], deduped_profiles) do
    deduped_profiles
  end

  def on_account_id([current_profile | remaining_profiles], deduped_profiles) do
    current_account_id = current_profile["$properties"]["Account ID"]
    deduped_profile = deduped_profiles
                      |> Enum.find(fn deduped_profile ->
                        deduped_profile.account_id == current_account_id
                      end)
    case deduped_profile do
      nil ->
        deduped_profiles = deduped_profiles ++ [
          %{account_id: current_account_id,
            distinct_id: [current_profile["$distinct_id"]],
            email: [current_profile["$properties"]["$email"]]
          }
        ]
      %{account_id: account_id, distinct_id: distinct_id, email: email} ->
        deduped_profiles = List.delete(deduped_profiles, deduped_profile)
        deduped_profiles = deduped_profiles ++ [
          %{account_id: current_account_id,
            distinct_id: deduped_profile.distinct_id ++ [current_profile["$distinct_id"]],
            email: deduped_profile.email ++ [current_profile["$properties"]["$email"]]
          }
        ]
    end
    on_account_id(remaining_profiles, deduped_profiles)
  end
end
