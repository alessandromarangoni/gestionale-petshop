<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <title>Login</title>
</head>
<body>
    <div class="vh-100">
        <nav class="navbar bg-warning">
            <div class="container-fluid d-flex justify-content-center">
                <div class="row d-flex justify-content-between w-100">
                    <div class="col-4"><img src="./image/petshopLogo.png" alt="logo" class="img-fluid logo"></div>
                    <div class="col-4 d-none d-md-flex justify-content-center align-items-center">
                        <h3 class="fw-bolder text-white">PETSHOP</h3>
                    </div>
                    <div class="col-4 justify-content-end align-items-center d-flex">
                        <button class="btn btn-light rounded-5"><a href="index.jsp" class="text-decoration-none text-warning fw-semibold">Accedi</a></button>
                    </div>
                </div>
            </div>
          </nav>
    
          <main class=" pt-2 mt-5">
            <section class="pt-5 mt-5 d-flex flex-column align-items-center ">
            <form action="/gestionalePetshop/Register" method="POST" class="rounded-5" id="form">
                <div class="d-flex flex-column h-100 px-5 py-4 rounded-5 justify-content-around border border-3 border-warning">
               	 	<div class="text-center">
	                    <h3 class="text-warning fw-bolder">
	                        Registrati
	                    </h3>
                   	</div>
                    <div class="row">
                        <div class="col">
                            <input type="text" class="form-control rounded-5 border border-1 border-warning rounded-5 border border-1 border-warning" placeholder="Nome" name="nome" id="nome">
                          </div>
                          <div class="col">
                            <input type="text" class="form-control rounded-5 border border-1 border-warning" placeholder="Cognome" name="cognome" id="nome">
                        </div>
                    </div>
                    
                    <div class="pt-2">
                        <input type="email" class="form-control rounded-5 border border-1 border-warning" name="mail" id="mail" placeholder="E-mail">
                    </div>

                    <div class="pt-2">
                        <label for="date">Data di nascita:</label>
                        <input type="date" class="rounded-3 border border-1 border-warning text-black-50" id="data-nascita" name="data-nascita" value="2023-12-19" min="1800-01-01" max="2023-12-19" />
                    </div>

                    <div class="pt-2">
                        <input type="text" class="form-control rounded-5 border border-1 border-warning" name="cellulare" id="cellulare" placeholder="cellulare" minlength="9" maxlength="10">
                    </div>

                    <div class="pt-2">
                        <input type="password" class="form-control rounded-5 border border-1 border-warning" name="password" id="password" placeholder="Password">
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-warning rounded-5 text-white fw-bold mt-4">Registrati</button>
                    </div>

                </div>
                
            </form>
        </section>
          </main>
    </div>
</body>
