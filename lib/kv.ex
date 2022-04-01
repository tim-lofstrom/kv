defmodule KV do
  def a do
    %{"login" => "alice", "email" => "some_email", "password" => "password"}
  end

  def extract_login(%{"login" => login}), do: {:ok, login}
  def extract_login(_), do: {:error, "login missing"}

  def extract_email(%{"email" => email}), do: {:ok, email}
  def extract_email(_), do: {:error, "email missing"}

  def extract_password(%{"password" => password}), do: {:ok, password}
  def extract_password(_), do: {:error, "password missing"}

  def extract_user(user) do
    with {:ok, login} <- extract_login(user),
         {:ok, email} <- extract_email(user),
         {:ok, password} <- extract_password(user) do
      {:ok, %{login: login, email: email, password: password}}
    end
  end

  def hello do
    :world
  end

  def max(a, b) do
    if a >= b, do: a, else: b
  end

  def maxcond(a, b) do
    cond do
      a >= b -> a
      true -> b
    end
  end

  def maxcase(a, b) do
    case a >= b do
      true -> a
      false -> b
    end
  end
end
