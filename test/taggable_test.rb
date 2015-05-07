require "test_helper"

class TaggableTest < ActiveSupport::TestCase
  def setup
    @tag_1 = Tag.create!(name: "foo")
    @tag_2 = Tag.create!(name: "bar")
  end

  def test_tagged_with_tags
    taggable_1 = TaggableObject.create!(tags: [@tag_1])
    taggable_2 = TaggableObject.create!(tags: [@tag_1, @tag_2])

    assert_equal [taggable_1, taggable_2], TaggableObject.tagged_with([@tag_1]).order(:id)
    assert_equal [taggable_2],             TaggableObject.tagged_with([@tag_2]).order(:id)
    assert_equal [taggable_1, taggable_2], TaggableObject.tagged_with([@tag_1, @tag_2]).order(:id)
  end

  def test_tagged_with_strings
    taggable_1 = TaggableObject.create!(tags: [@tag_1])
    taggable_2 = TaggableObject.create!(tags: [@tag_1, @tag_2])

    assert_equal [taggable_1, taggable_2], TaggableObject.tagged_with(%w(foo)).order(:id)
    assert_equal [taggable_2],             TaggableObject.tagged_with(%w(bar)).order(:id)
    assert_equal [taggable_1, taggable_2], TaggableObject.tagged_with(%w(foo bar)).order(:id)
  end

  def test_tag_list
    taggable = TaggableObject.create(tags: [@tag_1, @tag_2])

    assert_equal "foo, bar", taggable.tag_list
  end

  def test_set_tag_list
    taggable = TaggableObject.new

    taggable.tag_list = "foo, baz"

    assert_equal "foo, baz", taggable.tag_list
  end

  def test_set_tag_list_when_existing_tags
    taggable = TaggableObject.new(tags: [@tag_1])

    taggable.tag_list = "foo, baz"

    assert_equal "foo, baz", taggable.tag_list
  end

  def test_set_tag_list_with_duplicates
    taggable = TaggableObject.new

    taggable.tag_list = "foo, baz, foo"

    assert_equal "foo, baz", taggable.tag_list
  end
end
