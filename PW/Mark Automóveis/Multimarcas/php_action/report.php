<?php
//Conexão
include_once 'db_connect.php';
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />
  <title>Mark Multimarcas</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
  <link href="../css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
  <link href="../css/style.css" type="text/css" rel="stylesheet" media="screen,projection" />
  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="../js/materialize.js"></script>
  <script src="../js/init.js"></script>
</head>

<body>

  <div class="btn-large blue lighten-3 top right">
    <a href="" onclick="window.print()">Imprimir</a>
  </div>

  <div class="row center">
    <img src="../assets/images/Mark Multi.png" width="200px">
    <h3>Relatório</h3>

    <?php
    if (isset($_POST['btn-report'])) :
      $marcaselecionada = $_POST['marcaselecionada'];

      if ($marcaselecionada == "Todas as marcas") :
        $sql = "SELECT * FROM estoque ORDER BY marca, modelo, mod_fab";
      else :
        $sql = "SELECT * FROM estoque WHERE marca = '$marcaselecionada' ORDER BY marca, modelo, mod_fab";
      endif;
    endif;
    ?>

    <h4 class=""><?php echo ($marcaselecionada) ?></h4>
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
            </tr>

          <?php endwhile; ?>
        </tbody>
      </table>
    </div>
  </div>



</body>

</html>