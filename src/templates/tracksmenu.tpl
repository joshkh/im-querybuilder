<!-- <div class="flexcol fullheight stubify"> -->
  <!-- <div class="items"> -->
    <!-- <span class="item">Gene</span>
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
    <span class="item">Inetron</span> -->
  <!-- </div> -->
<!-- </div> -->


<!-- <% debugger; %> -->
<h1>Available Tracks</h1>


<% model.get('tracks').each(function(next) { %>
  <div class="item" data-track="<%= next.get('description') %>"><%= next.get('description') %></div>
<% }); %>

<!-- <% _model.get('paths').each(function(next) { %>
  <div class="item" data-collection=""><%= next.get('displayName') %></div>
<% }); %> -->



<!-- <span class="item">Gene</span>
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
<span class="item">Inetron</span> -->
