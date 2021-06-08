<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>" />
</head>
<body>
<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj Agata
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href="#">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active">Start</a></li>
            <li><a href="/" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="/" class="btn btn--without-border">O nas</a></li>
            <li><a href="/" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="/" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Oddaj rzeczy, których już nie chcesz<br />
                <span class="uppercase">potrzebującym</span>
            </h1>

            <div class="slogan--steps">
                <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
                <ul class="slogan--steps-boxes">
                    <li>
                        <div><em>1</em><span>Wybierz rzeczy</span></div>
                    </li>
                    <li>
                        <div><em>2</em><span>Spakuj je w worki</span></div>
                    </li>
                    <li>
                        <div><em>3</em><span>Wybierz fundację</span></div>
                    </li>
                    <li>
                        <div><em>4</em><span>Zamów kuriera</span></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
<form:form action="add" method="post" modelAttribute="donation">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>


        <!-- STEP 1: class .active is switching steps -->
        <div data-step="1" class="active" >
            <h3>Zaznacz co chcesz oddać:</h3>

            <c:forEach items="${categories}" var="category" >
            <div class="form-group form-group--checkbox">
                <label>



                         <form:input
                                 input="checkboxes"
                                 type="checkboxes"
                                 name="categories"
                            path="categories"
                            items="${categories}"
                         itemsValue="category.name"
                         id="category"/>
                    <span class="checkbox"></span>
                    <span class="description" id="bags-categories"
                    >${category.name}</span>

                </label>
            </div>
            </c:forEach>


            <div class="form-group form-group--buttons">
                <form:button type="button" class="btn next-step" >Dalej</form:button>
            </div>
        </div>

        <!-- STEP 2 -->
        <div data-step="2">
            <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

            <div class="form-group form-group--inline">
                <label path ="quantity">
                    Liczba 60l worków:
                </label>

                <form:input  path ="quantity"  id="quantity" type = "number" step="1" min="1"/>


            </div>

            <div class="form-group form-group--buttons">
                <form:button type="button" class="btn prev-step">Wstecz</form:button>
                <form:button type="button" class="btn next-step">Dalej</form:button>
            </div>
        </div>



        <!-- STEP 4 -->
        <div data-step="3">
            <h3>Wybierz organizacje, której chcesz pomóc:</h3>

            <c:forEach items="${institutions}" var="institution" >

                <div class="form-group form-group--checkbox">
                    <label>
                        <form:label path="institution"/>


                        <form:input input="checkbox"
                                items="${institutions}"
                                         path="institution"
                                    itemsValue="institution.id"

                                    id="institution"
                        />

                        <span class="checkbox radio"></span>
                        <span class="description">
                  <div class="title" >Fundacja ${institution.name}</div>
                  <div class="subtitle">
                          ${institution.description}
                  </div>
                </span>
                    </label>
                </div>
            </c:forEach>



            <div class="form-group form-group--buttons">
                <form:button type="button" class="btn prev-step">Wstecz</form:button>
                <form:button type="button" class="btn next-step">Dalej</form:button>
            </div>
        </div>

        <!-- STEP 5 -->
        <div data-step="4">
            <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

            <div class="form-section form-section--columns">
                <div class="form-section--column" id="address">
                    <h4>Adres odbioru</h4>
                    <div class="form-group form-group--inline">
                        <label path="street" id= "street" > Ulica  </label>
                        <form:input path="street" type="text" name="street"/>
                    </div>

                    <div class="form-group form-group--inline">
                        <label path="city" id="city">Miasto </label>
                         <form:input path="city" type="text"  name="city"/>
                    </div>

                    <div class="form-group form-group--inline">
                        <label path="zipCode" id="zipCode">Kod pocztowy</label>
                             <form:input path="zipCode" type="text" name="zipCode"/>

                    </div>

                    <div class="form-group form-group--inline">
                        <label path="phone" id="phone">Numer telefonu</label>
                             <form:input path="phone" type="phone"  name="phone"/>

                    </div>
                </div>

                <div class="form-section--column" id="shipping">
                    <h4>Termin odbioru</h4>
                    <div class="form-group form-group--inline">
                        <label path="pickUpDate" id= "pickUpDate"> Data </label>
                            <form:input path="pickUpDate" type="date"  name="pickUpDate"/>
                    </div>

                    <div class="form-group form-group--inline">
                        <label path="pickUpTime" id="pickUpTime" > Godzina </label>
                            <form:input path="pickUpTime" type="time" name="pickUpTime" />
                    </div>

                    <div class="form-group form-group--inline">
                        <label path="pickUpComment" id="pickUpComment">
                            Uwagi dla kuriera</label>
                            <form:textarea path="pickUpComment" name="pickUpComment"   rows="5"/>

                    </div>
                </div>
            </div>
            <div class="form-group form-group--buttons">
                <form:button type="button" class="btn prev-step">Wstecz</form:button>
                <form:button type="button" class="btn next-step">Dalej</form:button>
            </div>
        </div>

        <!-- STEP 6 -->
        <div data-step="5">
            <h3>Podsumowanie Twojej darowizny</h3>

            <div class="summary">
                <div class="form-section">
                    <h4>Oddajesz:</h4>
                    <ul>
                        <li>
                            <span class="icon icon-bag"></span>
                            <span class="summary--text"
                            ></span
                            >
                        </li>

                        <li>
                            <span class="icon icon-hand"></span>
                            <span class="summary--text"
                            ></span
                            >
                        </li>
                    </ul>
                </div>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru:</h4>
                        <ul>

                        </ul>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru:</h4>
                        <ul>
                            <li></li>

                        </ul>
                    </div>
                </div>
            </div>

            <div class="form-group form-group--buttons">
                <form:button type="button" class="btn prev-step">Wstecz</form:button>
                <form:button type="submit" class="btn">Potwierdzam</form:button>
            </div>
        </div>


        </form:form>


    </div>
</section>

<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form class="form--contact">
            <div class="form-group form-group--50">
                <input type="text" name="name" placeholder="Imię" />
            </div>
            <div class="form-group form-group--50">
                <input type="text" name="surname" placeholder="Nazwisko" />
            </div>

            <div class="form-group">
            <textarea
                    name="message"
                    placeholder="Wiadomość"
                    rows="1"
            ></textarea>
            </div>

            <button class="btn" type="submit">Wyślij</button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"
            ><img src="<c:url value="resources/images/icon-facebook.svg"/>"/></a>
            <a href="#" class="btn btn--small">
                <img src="<c:url value="resources/images/icon-instagram.svg"/>"/></a>
        </div>
    </div>
</footer>

<script src="<c:url value="resources/js/app.js"/>"></script>

</body>
</html>
