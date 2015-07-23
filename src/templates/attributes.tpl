<ul>
  <% _.each(model.get('paths'), function(next) { %>
    <li>test <%= next.get('id') %></li>
  <% }); %>
<ul>
