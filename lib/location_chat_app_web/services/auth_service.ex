defmodule LocationChatAppWeb.AuthService do
  use HTTPoison.Base

  alias LocationChatApp.Accounts

  @expected_fields ~w(
    id picture first_name last_name
  )

  @facebook_url "https://graph.facebook.com/v2.12/me?fields=first_name,last_name,email,picture.height(200)"

  def authWithFacebook(token) do
    with %{"id" => facebook_id, "picture" => picture, "first_name" => first_name, "last_name" => last_name} <- getFacebookUser(token) do
      Accounts.find_or_create_with_facebook(facebook_id,
        %{  "picture"     => picture,
            "last_name"   => last_name,
            "first_name"  => first_name,
            "facebook_id" => facebook_id
          }
      )
    end
  end

  defp getFacebookUser(token) do
    case HTTPoison.get("#{@facebook_url}&access_token=#{token}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Poison.decode!
        |> Map.take(@expected_fields)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, :unauthorized}
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

end
