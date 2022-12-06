defmodule Day1.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = Day1.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "accumulates updates", %{bucket: bucket} do
    assert Day1.Bucket.get(bucket, 1) == nil
    Day1.Bucket.collect(bucket, 1, "1000")
    assert Day1.Bucket.get(bucket, 1) == ["1000"]
    Day1.Bucket.collect(bucket, 1, "5000")
    assert Day1.Bucket.get(bucket, 1) == ["1000", "5000"]


  end
end
