<%@ page import="com.example.model.Emp" %>
<%@ page import="com.example.model.Departement" %>
<%
    Emp[] liste=(Emp[])request.getAttribute("o");
    Departement[] dept=(Departement[])request.getAttribute("depts");
%>
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <div class="col-sm-12 col-xl-12">
            <div class="bg-secondary rounded h-100 p-4">
                <h6 class="mb-4">Liste de emp</h6>
                <table class="table">
                    <thead>
                        <tr>                            
                            <th scope="col">Idemp</th><th scope="col">Label</th><th scope="col">Embauche</th><th scope="col">Salaire</th><th scope="col">Dept</th>
                        </tr>
                    <tbody>
                        <% for(Emp o:liste){ %>
                            <tr>
                                <td><%= o.getIdemp() %></td><td><%= o.getLabel() %></td><td><%= o.getEmbauche() %></td><td><%= o.getSalaire() %></td><td><%= o.getDept().getLabel() %></td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifiermodal<%= o.getIdemp() %>">
                                        <p><i class="bi bi-pencil"></i>Modifier</p>
                                    </button>
                                    <div class="modal fade" id="modifiermodal<%= o.getIdemp() %>" tabindex="-1" aria-labelledby="modifiermodalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                        <form action="/updateemp.do" method="post">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="modifiermodalLabel">Modifier un emp</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <input type="hidden" name="idemp" value="<%= o.getIdemp() %>">
                                            <div class="mb-3"> 
    <label for="labelinput" class="form-label">Label
    </label> 
    <input type="text" class="form-control" id="labelinput" aria-describedby="labelhelp" name="label" value="<%= o.getLabel() %>"> 
</div>
<div class="mb-3"> 
    <label for="embaucheinput" class="form-label">Embauche
    </label> 
    <input type="date" class="form-control" id="embaucheinput" aria-describedby="embauchehelp" name="embauche" value="<%= o.getEmbauche() %>"> 
</div>
<div class="mb-3"> 
    <label for="salaireinput" class="form-label">Salaire
    </label> 
    <input type="text" class="form-control" id="salaireinput" aria-describedby="salairehelp" name="salaire" value="<%= o.getSalaire() %>"> 
</div>
<div class="form-floating mb-3"> 
    <select class="form-select" id="deptSelect" name="dept">
        <% for(Departement f:dept){ %>
        <option value="<%= f.getIddept() %>" <% if(f.getIddept().equals(o.getDept().getIddept())){ out.print("selected"); } %>>
            <%= f.getLabel() %>
        </option>
        <% } %>
    </select> 
    <label for="deptSelect">
        Dept
    </label> 
</div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary">Valider</button>
                                        </div>
                                        </form>
                                        </div>
                                    </div>
                                    </div>
                                </td>
                                <td><form action="${pageContext.request.contextPath}/deleteemp.do" method="post">
                                    <input type="hidden" name="idemp" value="<%= o.getIdemp() %>">
                                    <button type="submit" class="btn btn-danger">
                                        <p><i class="bi bi-trash"></i>Supprimer</p>
                                    </button>
                                </form></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#ajoutmodal">
                    <p><i class="bi bi-plus"></i>Ajouter</p>
                </button>
            </div>
        </div>
        <!-- Button modal ajout -->

        <!-- Modal Ajout -->
        <div class="modal fade" id="ajoutmodal" tabindex="-1" aria-labelledby="ajoutmodalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
            <form action="${pageContext.request.contextPath}/insertemp.do" method="post">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="ajoutmodalLabel">Ajouter un emp</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3"> 
    <label for="labelinput" class="form-label">Label
    </label> 
    <input type="text" class="form-control" id="labelinput" aria-describedby="labelhelp" name="label"> 
</div>
<div class="mb-3"> 
    <label for="embaucheinput" class="form-label">Embauche
    </label> 
    <input type="date" class="form-control" id="embaucheinput" aria-describedby="embauchehelp" name="embauche"> 
</div>
<div class="mb-3"> 
    <label for="salaireinput" class="form-label">Salaire
    </label> 
    <input type="text" class="form-control" id="salaireinput" aria-describedby="salairehelp" name="salaire"> 
</div>
<div class="form-floating mb-3"> 
    <select class="form-select" id="deptSelect" name="dept">
        <% for(Departement f:dept){ %>
        <option value="<%= f.getIddept() %>">
            <%= f.getLabel() %>
        </option>
        <% } %>
    </select> 
    <label for="deptSelect">
        Dept
    </label> 
</div>

            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Valider</button>
            </div>
            </form>
            </div>
        </div>
        </div>
    </div>
</div>
