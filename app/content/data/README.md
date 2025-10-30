# Data

Perron can consume structured data from YML, JSON, or CSV files, making them available within your templates.
This is useful for populating features, team members, or any other repeated data structure.


## Usage

To use a data file, you can access it through the `Perron::Site.data` object followed by the basename of the file:
```erb
<% Perron::Site.data.features.each do |feature| %>
  <h4><%= feature.name %></h4>

  <p><%= feature.description %></p>
<% end %>
```

This is a convenient shorthand for `Perron::Data.new("features")`, which can also be used directly:
```ruby
<% Perron::Data.new("features").each do |feature| %>
  <h4><%= feature.name %></h4>

  <p><%= feature.description %></p>
<% end %>
```


## File Location and Formats

By default, Perron looks up `app/content/data/` for files with a `.yml`, `.json`, or `.csv` extension.
For a `new("features")` call, it would find `features.yml`, `features.json`, or `features.csv`. You can also provide a full, absolute path to any data file, like `Perron::Data.new("path-to-some-data-file")`.


## Accessing Data

The wrapper object provides flexible, read-only access to each record's attributes. Both dot notation and hash-like key access are supported.
```ruby
feature.name
feature[:name]
```


## Rendering

You can render data collections directly using Rails-like partial rendering. When you call `render` on a data collection, Perron will automatically render a partial for each item.
```erb
<%= render Perron::Site.data.features %>
```

This expects a partial at `app/views/content/features/_feature.html.erb` that will be rendered once for each feature in your data file. The individual record is made available as a local variable matching the singular form of the collection name.
```erb
<!-- app/views/content/features/_feature.html.erb -->
<div class="feature">
  <h4><%= feature.name %></h4>
  <p><%= feature.description %></p>
</div>
```
