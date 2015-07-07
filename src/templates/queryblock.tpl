<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><%= model.get("displayName") %></h3>
  </div>
  <div class="panel-body">
    <% collection.each(function(next) { %>
        <span class="badge"> <%= next.get("human")%></span><br />
    <% }) %>
  </div>
</div>
