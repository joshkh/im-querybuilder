<div class="flex-querybox-container">


  <div class="column">

    <span class="heading">Starting with a </span>

    <div class="btn-group btn-input">
      <!-- <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <%= root %> <span class="caret"></span>
      </a> -->
      <input type="text" class="dropdown-toggle classInputText" data-toggle="dropdown">

      <ul class="dropdown-menu noflow" role="menu">
        <% _.each(classes, function(next) { %>
            <li><a data-classname="<%= next.name %>" class="classname" href="#"><%= next.name %></a></li/>
        <% }); %>
      </ul>
    </div>

  </div>

  <div class="column">
    <span class="heading">Attributes</span>
    <div class="flex-attribute-container">


        <% _.each(attributes, function(next) { %>
          <% var index = _.indexOf(selected, next.name); %>
          <% if (index > -1) { %>
            <div class="attribute toggleOn" data-attributename="<%= next.name %>"><%= next.name %><i class="fa fa-filter"></i></div>
          <% } %>
        <% }); %>
        <% _.each(attributes, function(next) { %>
          <% var index = _.indexOf(selected, next.name); %>
          <% if (index == -1) { %>
            <div class="attribute" data-attributename="<%= next.name %>"><%= next.name %><i class="fa fa-filter"></i></div>
          <% } %>
        <% }); %>
    </div>
  </div>

  <div class="toolbox">
    <div class="flex-tool-container">
      <div class="addcollection"><span class="glyphicon glyphicon-star" aria-hidden="true"></span></div>
    </div>
  </div>



</div>
