<style>
    
    
    
    

.footergrid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
}

footer {
    position: relative;
    background-color: #000000de;
    margin: 0px auto;
    max-width: 1580px;
    padding: 0px 30px;
    margin-top: 30px;
}

.quicklinkfooter {
    display: flex;
    flex-direction: column;
}

.quicklinkfooter a {
       margin: 10px 0px;
    text-decoration: none;
    font-size: 20px;
    color: white;
    transition: color 0.3s ease;
}

.quicklinkfooter a:hover {
    color: gray;
}

.quicklinkfooter h2 {
    font-size: 25px;
    padding-top: 50px;
    padding-bottom: 10px;
    color: white;
}

.footerlogo {
    text-align: center;
    padding-top: 50px;
}



.addressfooter {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.addressfooter p {
    text-align: center;
    line-height: 30px;
    margin-top: 30px;
    font-size: 19px;

    color: white;

}

.addressfooter h2 {
    font-size: 25px;
    text-align: center;
    padding-top: 50px;
    padding-bottom: 10px;
    color: white;
}

.copyright {
    padding: 5px 0px;
    position: relative;
  text-align: center;
}

.copyright p {
    color: white;
    text-align: center;
}



</style>



<footer>


        <div class="footergrid">
            <div class="footerlogo">
                <img src="web_images/13.png" alt="logo" width="150px">
            </div>


            <div class="quicklinkfooter">

                <h2>Quick Link</h2>

             
                 <a href="http://localhost:8080/e_commerce/home.jsp"> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> Home</a>
                <a href="http://localhost:8080/e_commerce/about_us.jsp"> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> About</a>
                <a href="http://localhost:8080/e_commerce/feedback.jsp"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> Feedback</a>
                <a href="#http://localhost:8080/e_commerce/view_customer_order.jsp"> <i class="fa fa-arrow-circle-right" aria-hidden="true"></i> View Order</a>
           

            </div>


            <div class="quicklinkfooter">
  <h2>categories</h2>

                 <a href="http://localhost:8080/e_commerce/electonic.jsp"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> Electronics</a>
                <a href="http://localhost:8080/e_commerce/clothing.jsp"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> Clothing</a>
                <a href="http://localhost:8080/e_commerce/books.jsp"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i> Books</a>
           
           
            </div>
        </div>
        
    <hr>
        <div class="copyright">
            <p> &copy; copyright 2024 QuickMart | ALL RIGHTS RESERVED. </p>
        </div>

    </footer>