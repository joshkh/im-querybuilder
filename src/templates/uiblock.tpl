

  <div class="contents">
    <span class="title"><%= model.get("root") %></span>

    <div class="divider"></div>



    <div>
      <input class="lookup" type="text" placeholder="Lookup" aria-describedby="basic-addon1">
    </div>

      <div class="divider"></div>


    <!-- <div>
      <i class="fa fa-list fa-lg"></i> Showing common fields.
    </div> -->

    <div class="views">
      <ul>
        <!-- <% debugger; %> -->
        <% model.get('selected').each(function(next) { %>
          <li><%= _.last(next.get('parts')) %></li>
        <% }); %>
      </ul>
    </div>



  <div class="divider"></div>


    <div class="toolbar">
      <div class="children-add-button">
        <span class="addblock label label-success">ADD BLOCK<span>
      </div>
      <div class="children-add-button">
        <span class="visible label label-info">Visible</span>
      </div>
      <div class="children-add-button">
        <span class="talkup label label-info">talkup</span>
      </div>
      <div class="children-add-button">
        <span class="remove label label-danger">Remove</span>
      </div>
      <div class="children-add-button">
        <span class="query label label-danger">Query</span>
      </div>
    </div>




  </div>


  <div class="children">


    <div class="children-entities">
      <!-- <span class="label label-primary">Stuff1</span>
      <span class="label label-primary">Stuff1</span>
      <span class="label label-primary">Stuff1</span> -->

    </div>


  </div>
