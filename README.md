# MixpanelWriter
[![Build Status](https://travis-ci.org/alienware/mixpanel-writer.svg?branch=master)](https://travis-ci.org/alienware/mixpanel-writer)
[![Code Climate](https://codeclimate.com/github/alienware/mixpanel-writer/badges/gpa.svg)](https://codeclimate.com/github/alienware/mixpanel-writer)
[![Coverage Status](https://coveralls.io/repos/github/alienware/mixpanel-writer/badge.svg?branch=master)](https://coveralls.io/github/alienware/mixpanel-writer?branch=master)
[![Inline docs](http://inch-ci.org/github/alienware/mixpanel-writer.svg)](http://inch-ci.org/github/alienware/mixpanel-writer)

**Elixir application to deduplicate Mixpanel profiles and create a structured data store out of them**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `mixpanel_writer` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:mixpanel_writer, "~> 0.1.0"}]
    end
    ```

  2. Ensure `mixpanel_writer` is started before your application:

    ```elixir
    def application do
      [applications: [:mixpanel_writer]]
    end
    ```

