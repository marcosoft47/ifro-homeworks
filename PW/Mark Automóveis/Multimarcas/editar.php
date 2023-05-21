<?php
// Conexão
include_once 'php_action/db_connect.php';

// Header
include_once 'includes/header.php';

if (isset($_GET['id'])) :
  $id = mysqli_escape_string($connect, $_GET['id']);
  $sql = "SELECT * FROM estoque WHERE id = '$id'";
  $resultado = mysqli_query($connect, $sql);
  $dados = mysqli_fetch_array($resultado);
endif;

?>

<div class="section no-pad-bot" id="index-banner">
  <div class="container">
    <br /><br />

    <div class="row center">
      <div class="s12">
        <h3 class="light">Editar carro</h3>


        <form action="php_action/update.php" method="POST">
          <input type="hidden" name="id" value="<?php echo $dados['id'] ?>">

          <div class="input-field col s12 m4">
            <input type="text" name="marca" id="marca" value="<?php echo $dados['marca'] ?>">
            <label for="marca">Marca</label>
          </div>

          <div class="input-field col s12 m4">
            <input type="text" name="modelo" id="modelo" value="<?php echo $dados['modelo'] ?>">
            <label for="modelo">Modelo</label>
          </div>

          <div class="input-field col s12 m4">
            <input type="text" name="descricao" id="descricao" value="<?php echo $dados['descricao'] ?>">
            <label for="descricao">Descrição</label>
          </div>

          <div class="input-field col s12 m4">
            <input type="text" name="mod_fab" id="mod_fab" value="<?php echo $dados['mod_fab'] ?>">
            <label for="mod_fab">Modelo/Fabricação</label>
          </div>

          <div class="input-field col s12 m4">
            <input type="text" name="cor" id="cor" value="<?php echo $dados['cor'] ?>">
            <label for="cor">Cor</label>
          </div>

          <div class="input-field col s12 m4">
            <input type="text" name="placa" id="placa" value="<?php echo $dados['placa'] ?>">
            <label for="placa">placa</label>
          </div>

          <div class="input-field col s12">
            <input type="text" name="valor" id="valor" value="<?php echo $dados['valor'] ?>">
            <label for="valor">Valor (R$)</label>
          </div>

          <button type="submit" name="btn-edit" class="btn blue">Salvar</button>

        </form>
      </div>

    </div>
  </div>

  <br /><br />
</div>
</div>

<br /><br />
</div>

<?php

// Footer
include_once 'includes/footer.php';
?>