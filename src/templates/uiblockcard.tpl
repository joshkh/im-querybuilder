

<div class="flexcol">

  <div class="flexcontent">
    <div class="flexrow">
      <span class="var collection flexitem cangrow"><%= model.get("desc") %></span>
    </div>
    <div class="flexrow">
      <div class="flexitem filter">
        <input type="text" class="filtertextbox" placeholder="filter"></input>
      </div>
      <div class="flexitem values">
        <span class="showlists">Specific Value<span>
      </div>
      <div class="flexitem listname">
        <span class="showlists">From a list<span>
      </div>
    </div>
    <!-- <div class="flexrow">
      <div class="flexlist">
        <% model.get('selected').each(function(next) { %>
          <div><%= _.last(next.get('parts')) %></div>
        <% }); %>
      </div>
    </div> -->

    <% if (model.get("showorg") == true) { %>
    <!-- <% if (typeof(date) !== "undefined") { %> -->
      <div class="">
      <div class="flexrow">
        <span class="var collection flexitem cangrow">Organism</span>
      </div>
      <div class="flexrow">
        <div class="flexitem filter">
          <input type="text" class="filtertextbox" placeholder="filter"></input>
        </div>
        <div class="flexitem listname">
          <select class="selectpicker">
            <% model.get('pathValues').each(function(next) { %>

              <% if (next.get('value') == "D. melanogaster") { %>
                <option selected="selected"><%= next.get('value') %></option>
              <% } else { %>
                <option><%= next.get('value') %></option>
                <% } %>
            <% }); %>
          </select>
        </div>
        <div class="flexitem listname">
          <span class="showlists">From a list<span>
        </div>
      </div>

    </div>
  <% } %>

  <div class="flexrow toolbar">
    <div class="flexitem">
      <span class="addtrack">Add Related Items</span>
    </div>
  </div>



  </div>


</div>



<div class="flexcol fullheight menu stubify">
</div>



<!--
<div class="flexcol fullheight stubify">
  <div class="items">
    <span class="item">Gene</span>
    <span class="item" data-model="Protein">Protein</span>
    <span class="item">Homologue</span>
    <span class="item">Chromosome</span>
    <span class="item">Disease</span>
    <span class="item">SNP</span>
    <span class="item">Data Set</span>
    <span class="item">Cross Reference</span>
    <span class="item" data-model="GOTerm">GO Term</span>
    <span class="item">Interaction</span>
    <span class="item">Location</span>
    <span class="item">Inetron</span>
  </div>
</div> -->





<!--
  <div class="contents">
    <span class="title"><%= model.get("root") %></span>
    <div class="divider"></div>
    <div>
      <input class="lookup" type="text" placeholder="Lookup" aria-describedby="basic-addon1">
    </div>
      <div class="divider"></div>
    <div class="views">
      <ul>
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
    </div>
  </div> -->
