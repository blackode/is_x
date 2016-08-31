defmodule IsX do
  @moduledoc ~S"""

                ___    __  __     __  __           _       _
               |_ _|___\ \/ /    |  \/  | ___   __| |_   _| | ___
                | |/ __|\  /     | |\/| |/ _ \ / _` | | | | |/ _ \
                | |\__ \/  \     | |  | | (_) | (_| | |_| | |  __/
               |___|___/_/\_\    |_|  |_|\___/ \__,_|\__,_|_|\___|


  This module comprises of truth value definitions like the whether the data is
  empty or blank or null or nil or its length is 0 like.

  To say in one word the extended functions of value assertion functions

  """
  @doc ~S"""
  Checks for the blank Strings
  Spaces are treated as blank here

  ## Examples

      iex> IsX.is_blank(Null)
      true
      iex> IsX.is_blank(nil)
      true
      iex> IsX.is_blank("")
      true
      iex> IsX.is_blank(" ")
      true
      iex> IsX.is_blank([])
      true
      iex> IsX.is_blank({})
      true
      iex> IsX.is_blank("\n\t")
      true
      iex> IsX.is_blank(%{})
      true
      iex> IsX.is_blank()
      true
      iex> IsX.is_blank([1,2,3])
      false
      iex> IsX.is_blank(%{name: "blackode"})
      false
      iex> IsX.is_blank(12345)
      false
      iex> IsX.is_blank("blackode")
      false


  """

  @spec is_blank(term()) :: boolean()

  def is_blank(data) when data in [nil,[],%{},{},"\n\t",Null] do
    true
  end

  def is_blank data do

    if is_binary(data), do: Regex.match?(~r/^\s*\Z/,data), else: false
  end

  def is_blank do
    true
  end

  @doc ~S"""

  Checks the given data is empty or not .
  Spaces,new_lines,tabs treated as binary  here

  ## Examples

      iex> IsX.is_empty(Null)
      true
      iex> IsX.is_empty(nil)
      true
      iex> IsX.is_empty("")
      true
      iex> IsX.is_empty([])
      true
      iex> IsX.is_empty(%{})
      true
      iex> IsX.is_empty()
      true
      iex> IsX.is_empty([1,2,3])
      false
      iex> IsX.is_empty(%{name: "blackode"})
      false
      iex> IsX.is_empty("blackode")
      false
      iex> IsX.is_empty(12345)
      false
      iex> IsX.is_empty(" ")
      false
      iex> IsX.is_empty("\n\t")
      false


  """

  @spec is_empty(term()) :: boolean()

  def is_empty(data) when data in ["",nil,[],%{},Null] do
    true
  end

  def is_empty data do
    false
  end

  def is_empty do
    true
  end

  @doc ~S"""

  Here except the nil and Null rest are treated as data present
  empty maps,tuples and lists are treated as the data

  ## Examples

      iex> IsX.is_none(Null)
      true
      iex> IsX.is_none(nil)
      true
      iex> IsX.is_none()
      true
      iex> IsX.is_none("")
      false
      iex> IsX.is_none(" ")
      false
      iex> IsX.is_none([])
      false
      iex> IsX.is_none({})
      false
      iex> IsX.is_none("\n\t")
      false
      iex> IsX.is_none(%{})
      false
      iex> IsX.is_none([1,2,3])
      false
      iex> IsX.is_none(%{name: "blackode"})
      false

  """

  @spec is_none(term()) :: boolean()

  def is_none(data) when data in [nil,Null] do
    true
  end

  def is_none _data do
    false
  end

  def is_none do
    true
  end

  @doc ~S"""

  Here except the nil and Null ,data is true
  Even the false and true also treated as data

  ## Examples

      iex> IsX.is_present(Null)
      false
      iex> IsX.is_present(nil)
      false
      iex> IsX.is_present()
      false
      iex> IsX.is_present("")
      false
      iex> IsX.is_present(" ")
      false
      iex> IsX.is_present([])
      false
      iex> IsX.is_present({})
      false
      iex> IsX.is_present("\n\t")
      false
      iex> IsX.is_present(%{})
      false
      iex> IsX.is_present(0)
      true
      iex> IsX.is_present([1,2,3])
      true
      iex> IsX.is_present(%{name: "blackode"})
      true
      iex> IsX.is_present(true)
      true
      iex> IsX.is_present(false)
      true
      iex> IsX.is_present(:false)
      true
      iex> IsX.is_present(:true)
      true

  """
  @spec is_present(term()) :: boolean()

  def is_present do
    false
  end

  def is_present(data) when data in [false,true] do
    true
  end

  def is_present(data) when data in [nil,Null,"\n\t",[],%{},{}] do
    false
  end

  def is_present(data) when is_binary(data) do
    if Regex.match?(~r/^\s*\z/,data), do: false, else: true
  end

  def is_present(data) do
    true
  end

  @doc ~S"""

  Returns true if the given data is not a number
  or else returns false

  ## Examples

      iex> IsX.is_nan("blackode 1234")
      true
      iex> IsX.is_nan("1234")
      true
      iex> IsX.is_nan(1234)
      false

  """
  @spec is_nan(term()) :: boolean()

  def is_nan data  do
    if is_number(data), do: false, else: true
  end

  @doc ~S"""
  Checks whether the passed value is zero or not

  ## Examples

      iex> IsX.is_zero 0
      true
      iex> IsX.is_zero(length([]))
      tue
      iex> IsX.is_zero("blackode")
      false
      iex> IsX.is_zero 1234
      false
      iex> IsX.is_zero 0.0
      false

  """
  @spec is_zero(term()) :: boolean()

  def is_zero data do
    if data === 0, do: true, else: false
  end

  @doc ~S"""

  Checks given number is positive or not


  ## Examples

      iex> IsX.is_positive 0
      true
      iex> IsX.is_positive 7
      true
      iex> IsX.is_positive -7
      false

  """
  @spec is_positive(number()) :: boolean()

  def is_positive num do
    if is_number(num), do: if num >= 0, do: true, else: false end

  @doc ~S"""

  Checks given number is negative or not

  ## Examples

      iex> IsX.is_negative 0
      false
      iex> IsX.is_negative 7
      false
      iex> IsX.is_negative -7
      true

  """
  @spec is_negative(number()) :: boolean()

  def is_negative num do
    if is_number(num), do: if num >= 0, do: false, else: true
  end


  end
