

  <div class="contents">
    <span class="title"><%= model.get("name") %></span>

    <div class="divider"></div>



    <div>
      <input class="lookup" type="text" placeholder="Lookup" aria-describedby="basic-addon1">
    </div>

      <div class="divider"></div>


    <div>
      <i class="fa fa-list fa-lg"></i> Showing common fields.
    </div>

    <div>
      <ul>
        <% _.each(model.get('views'), function(next) { %>
          <li><%= next.get('dn') %></li>
        <% }); %>
      </ul>
    </div>



  <div class="divider"></div>


    <div class="toolbar">
      <div class="children-add-button">
        <span class="add label label-success">Add<span>
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
