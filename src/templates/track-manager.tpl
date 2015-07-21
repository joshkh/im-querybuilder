<ul>
  <% collection.each(function(item) { %>
    <li><%= item.get('name') %></li>
  <% }); %>
</ul>
