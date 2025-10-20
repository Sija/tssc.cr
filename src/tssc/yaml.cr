module Time::Span::StringConverter
  def from_yaml(ctx : ::YAML::ParseContext, node : ::YAML::Nodes::Node) : Time::Span
    unless node.is_a?(::YAML::Nodes::Scalar)
      node.raise "Expected scalar, not #{node.kind}"
    end
    parse(node.value)
  end

  def to_yaml(value : Time::Span, yaml : ::YAML::Nodes::Builder)
    yaml.scalar dump(value)
  end
end
