<%@ page import="com.example.model.Departement" %>
<%
    Departement[] liste=(Departement[])request.getAttribute("o");
    
%>
<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <div class="col-sm-12 col-xl-12">
            <div class="bg-secondary rounded h-100 p-4">
                <h6 class="mb-4">Liste de Departement</h6>
                <table class="table">
                    <thead>
                        <tr>                            
                            <th scope="col">Iddept</th><th scope="col">Label</th><th scope="col">Numero</th>
                        </tr>
                    <tbody>
                        <% for(Departement o:liste){ %>
                            <tr>
                                <td><%= o.getIddept() %></td><td><%= o.getLabel() %></td><td><%= o.getNumero() %></td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifiermodal<%= o.getIddept() %>">
                                        <p><i class="bi bi-pencil"></i>Modifier</p>
                                    </button>
                                    <div class="modal fade" id="modifiermodal<%= o.getIddept() %>" tabindex="-1" aria-labelledby="modifiermodalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                        <form action="${pageContext.request.contextPath}/updatedept.do" method="post">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="modifiermodalLabel">Modifier un Departement</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <input type="hidden" name="iddept" value="<%= o.getIddept() %>">
                                            <div class="mb-3"> 
    <label for="labelinput" class="form-label">Label
    </label> 
    <input type="text" class="form-control" id="labelinput" aria-describedby="labelhelp" name="label" value="<%= o.getLabel() %>"> 
</div>
<div class="mb-3"> 
    <label for="numeroinput" class="form-label">Numero
    </label> 
    <input type="number" step="1.0" class="form-control" id="numeroinput" name="numero" value="<%= o.getNumero() %>"> 
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
                                <td><form action="${pageContext.request.contextPath}/deletedept.do" method="post">
                                    <input type="hidden" name="iddept" value="<%= o.getIddept() %>">
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
            <form action="${pageContext.request.contextPath}/insertdept.do" method="post">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="ajoutmodalLabel">Ajouter un Departement</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3"> 
    <label for="labelinput" class="form-label">Label
    </label> 
    <input type="text" class="form-control" id="labelinput" aria-describedby="labelhelp" name="label"> 
</div>
<div class="mb-3"> 
    <label for="numeroinput" class="form-label">Numero
    </label> 
    <input type="number" step="1.0" class="form-control" id="numeroinput" name="numero"> 
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
