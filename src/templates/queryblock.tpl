<div class="flex-querybox-container">


  <!--  Column 1 -->
  <div class="column">
    <!-- Top of Column 1 -->
    <div class="startingpoint">
      <span class="heading">Starting with a </span>
      <div class="btn-group btn-input">
        <input type="text" class="dropdown-toggle classInputText" data-toggle="dropdown">
        <ul class="dropdown-menu noflow" role="menu">
          <% _.each(classes, function(next) { %>
              <li><a data-classname="<%= next.name %>" class="classname" href="#"><%= next.name %></a></li/>
          <% }); %>
        </ul>
      </div>
    </div>

    <!--  Second row of Column 1-->
    <div class="attributes">
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

  </div>

  <!-- Column 2 -->
  <div class="column">
    <!--  Top of Column 2 -->
    <!--  Children go in here! -->
    <div class="children-container">


    </div>
  </div>

</div>





  <!-- <div class="column">

  </div>

  <div class="toolbox">
    <div class="flex-tool-container">
      <div class="addcollection"><span class="glyphicon glyphicon-star" aria-hidden="true"></span></div>
    </div>
  </div>



</div> -->
