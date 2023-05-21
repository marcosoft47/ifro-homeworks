<?php
//Conexão
include_once 'php_action/db_connect.php';

//Header
include_once 'includes/header.php';
?>
<div class="row center">
  <h3>Carros cadastrados</h3>
  <div class="s12">
    <table class="striped">
      <thead>
        <th>Marca</th>
        <th>Modelo</th>
        <th>Descrição</th>
        <th>Modelo/Fabricação</th>
        <th>Cor</th>
        <th>Placa</th>
        <th>Valor</th>
        <th>Ações</th>
      </thead>
      <tbody>
        <?php

        $sql = "SELECT * FROM estoque";
        $resultado = mysqli_query($connect, $sql);
        while ($dados = mysqli_fetch_array($resultado)) :

        ?>
          <tr>
            <td><?php echo $dados['marca']; ?></td>
            <td><?php echo $dados['modelo']; ?></td>
            <td><?php echo $dados['descricao']; ?></td>
            <td><?php echo $dados['mod_fab']; ?></td>
            <td><?php echo $dados['cor']; ?></td>
            <td><?php echo $dados['placa']; ?></td>
            <td><?php echo $dados['valor']; ?></td>
            <td><a href="editar.php?id=<?php echo $dados['id']; ?>" class="btn-floating blue"><i class="material-icons"> edit</i></a></td>
            <td><a href="#modal<?php echo $dados['id']; ?>" class="btn-floating red darken-1 modal-trigger"><i class="material-icons"> delete</i></a></td>

            <!-- MODAL -->
            <div id="modal<?php echo $dados['id']; ?>" class="modal">
              <div class="modal-content fixed footer">
                <h4>Deseja apagar esse registro?</h4>
                <p><?php echo $dados['marca']; ?> - <?php echo $dados['modelo']; ?> - <?php echo $dados['descricao']; ?> - <?php echo $dados['mod_fab']; ?> - <?php echo $dados['cor']; ?> - <?php echo $dados['placa']; ?></p>
              </div>
              <div class="modal-footer">

                <form action="php_action/delete.php" method="POST">
                  <input type="hidden" name=id value="<?php echo $dados['id']; ?>">

                  <a href="#!" class="modal-close waves-effect waves-green btn green">Não, não excluir</a>
                  <button type="submit" name="btn-delete" class="btn red waves-effect waves-red">Sim, excluir carro</button>
                </form>

              </div>
            </div>

          </tr>

        <?php endwhile; ?>
      </tbody>
    </table>
  </div>
</div>
<?php
//Footer
include_once 'includes/footer.php'

?>