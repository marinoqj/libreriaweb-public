<%@ include file="/WEB-INF/jsp/common/include_taglib.jsp"%>

<br>
<br>


<div class="container mt-5">

 
    <!--Section: Content-->
    <section class="dark-grey-text mb-5">
      
      <style>
        .map-container-section {
          overflow:hidden;
          padding-bottom:56.25%;
          position:relative;
          height:0;
        }
        .map-container-section iframe {
          left:0;
          top:0;
          height:100%;
          width:100%;
          position:absolute;
        }
      </style>

      <!-- Section heading -->
      <h3 class="font-weight-bold text-center mb-4">Contacto</h3>
      <!-- Section description -->
      <p class="text-center w-responsive mx-auto pb-5">Si tiene alguna consulta o sugerencia que hacernos, no dude en escribirnos un mensaje.</p>

      <!-- Grid row -->
      <div class="row">

        <!-- Grid column -->
        <div class="col-lg-5 mb-lg-0 pb-lg-3 mb-4">

          <!-- Form with header -->
          <div class="card">
            <div class="card-body">
              <!-- Header -->
              <div class="form-header blue accent-1">
                <h3 class="mt-2"><i class="fas fa-envelope"></i> Escr&iacute;banos:</h3>
              </div>
              <p class="dark-grey-text">Le contestaremos lo más r&aacute;pido posible.</p>
              <!-- Body -->
              <div class="md-form">
                <i class="fas fa-user prefix grey-text"></i>
                <input type="text" id="form-name" class="form-control">
                <label for="form-name">Su nombre</label>
              </div>
              <div class="md-form">
                <i class="fas fa-envelope prefix grey-text"></i>
                <input type="text" id="form-email" class="form-control">
                <label for="form-email">Su e-mail</label>
              </div>
              <div class="md-form">
                <i class="fas fa-tag prefix grey-text"></i>
                <input type="text" id="form-Subject" class="form-control">
                <label for="form-Subject">Asunto</label>
              </div>
              <div class="md-form">
                <i class="fas fa-pencil-alt prefix grey-text"></i>
                <textarea id="form-text" class="form-control md-textarea" rows="3"></textarea>
                <label for="form-text">Mensaje</label>
              </div>
              <div class="text-center">
                <button class="btn btn-light-blue">Enviar</button>
              </div>
            </div>
          </div>
          <!-- Form with header -->

        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-lg-7">

          <!--Google map-->
          <div id="map-container-section" class="z-depth-1-half map-container-section mb-4" style="height: 400px">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3037.636541019766!2d-3.7056720847421984!3d40.41690187936512!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd422880a07d7dc7%3A0x694aee57da1dc679!2sPuerta%20del%20Sol%2C%20Madrid!5e0!3m2!1ses!2ses!4v1606903644074!5m2!1ses!2ses" frameborder="0"
              style="border:0" allowfullscreen></iframe>
          </div>
          <!-- Buttons-->
          <div class="row text-center">
            <div class="col-md-4">
              <a class="btn-floating blue accent-1">
                <i class="fas fa-map-marker-alt"></i>
              </a>
              <p>Puerta del Sol 2, 1º<br>28038 Madrid</p>
<!--               <p class="mb-md-0">28038 Madrid</p> -->
            </div>
            <div class="col-md-4">
              <a class="btn-floating blue accent-1">
                <i class="fas fa-phone"></i>
              </a>
              <p>91 222 33 44<br>M-D 18:00-01:00</p>
<!--               <p class="mb-md-0">Lunes-Viernes, 8:00-20:00</p> -->
            </div>
            <div class="col-md-4">
              <a class="btn-floating blue accent-1">
                <i class="fas fa-envelope"></i>
              </a>
              <p>info@gmail.com<br>sale@gmail.com</p>
<!--               <p class="mb-0">sale@gmail.com</p> -->
            </div>
          </div>

        </div>
        <!-- Grid column -->

      </div>
      <!-- Grid row -->

    </section>
    <!--Section: Content-->


  </div>