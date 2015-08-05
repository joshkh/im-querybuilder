
<!-- <% debugger; %> -->
<h1>Available Lists</h1>

<% model.get('lists').each(function(next) { %>
  <!-- <% console.log("next is", next); %> -->
  <div class="item" data-list="<%= next.get('name')%>"><%= next.get('title')%> (<%= next.get('size')%>)</div>
<% }); %>
