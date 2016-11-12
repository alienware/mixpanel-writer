defmodule MixpanelWriterTest do
  use ExUnit.Case
  doctest MixpanelWriter

  test "dedup profiles list based on Account ID" do
    profiles = Poison.Parser.parse!(~s([
        {"$distinct_id": 1, "$properties": {"Account ID": 1, "$email": "1@practo.com"}},
        {"$distinct_id": 2, "$properties": {"Account ID": 2, "$email": "2@practo.com"}},
        {"$distinct_id": 3, "$properties": {"Account ID": 1, "$email": "3@practo.com"}}
      ]))
    assert MixpanelWriter.Dedup.on_account_id(profiles) -- [
      %{account_id: 1, distinct_id: [1, 3], email: ["1@practo.com", "3@practo.com"]},
      %{account_id: 2, distinct_id: [2], email: ["2@practo.com"]}
    ] == []
  end
end
