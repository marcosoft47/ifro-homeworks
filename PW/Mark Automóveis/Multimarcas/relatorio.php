<?php
//Conexão
include_once 'php_action/db_connect.php';

//Header
include_once 'includes/header.php';
?>
<div class="section no-pad-bot" id="index-banner">
  <div class="container">
    <br />
    <div class="row center">
      <div class="col s12">
        <h3>Relatórios</h3>

        <form action="php_action/report.php" target="_blank" method="POST">
          <div class="col s6">
            <label for="marca">Selecione a marca:</label>

            <select name="marcaselecionada">
              <option>Todas as marcas</option>

              <?php
              $sql = "SELECT DISTINCT marca FROM estoque";
              $resultado = mysqli_query($connect, $sql);

              while ($dados = mysqli_fetch_array($resultado)) :
              ?>
                <option><?php echo $dados['marca']; ?></option>
              <?php endwhile; ?>
            </select>
          </div>

          <div class="col s6">
            <br />
            <input type="submit" name="btn-report" class="btn blue">
          </div>

        </form>
      </div>
    </div>
  </div>
</div>

<?php
//Footer
include_once 'includes/footer.php'

?>