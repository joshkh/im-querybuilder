<div class="form-group">
  <label for="sel1">Select list:</label>
  <select class="form-control" id="sel1">
    <% _.each(collections, function(collection) { %>
      <option><%= collection %></option>
    <% }) %>
  </select>
</div>
