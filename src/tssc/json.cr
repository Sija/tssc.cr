module Time::Span::StringConverter
  def from_json(pull : ::JSON::PullParser) : Time::Span
    parse(pull.read_string)
  end

  def to_json(value : Time::Span, json : ::JSON::Builder)
    json.string dump(value)
  end
end
