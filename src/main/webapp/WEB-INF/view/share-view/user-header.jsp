<div class="container-fluid bg-primary px-5 d-none d-lg-block">
    <div class="row gx-0">
        <div class="col-lg-8 text-center text-lg-start mb-2 mb-lg-0">
            <div class="d-inline-flex align-items-center" style="height: 45px;">
                <div class="dropdown d-none me-2" id="myDropItem">
                    <a href="#" class="dropdown-toggle text-light" data-bs-toggle="dropdown" onclick = "testclick()">
                        <small><i class="fa fa-home me-2"></i> My Dashboard</small>
                    </a>
                    <div class="dropdown-menu rounded ">
                        <a href="/myprofile" class="dropdown-item"><i class="fas fa-user-alt me-2"></i> My Profile</a>
                        <a href="#" class="dropdown-item"><i class="fas fa-comment-alt me-2"></i> Inbox</a>
                        <a href="#" class="dropdown-item"><i class="fas fa-bell me-2"></i> Notifications</a>
                        <a href="#" class="dropdown-item"><i class="fas fa-cog me-2"></i> Account Settings</a>
                        <a onclick="LogOut()" class="dropdown-item"><i class="fas fa-power-off me-2"></i> Log Out</a>
                    </div>
                </div>
                <%@ include file="../user/login.jsp" %>
            </div>
        </div>
        <div class="col-lg-4 text-center text-lg-end">
            <div class="d-inline-flex align-items-center" style="height: 45px;">
                <div class="dropdown">
                    <a class="dropdown-toggle  me-2 fa fa-bell text-dark" data-bs-display="static" href="#" role="button" id="dropdownMenuLink"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Notifications
                    </a>

                    <div class="dropdown-menu dropdown-menu-lg-end  p-3" id="notificationBox">
                        <!-- Buttons to toggle between Promotion and Announcement -->
                        <div class="d-flex flex-column" id="noti-group">
                            <button class="btn btn-primary mb-2" id="showPromotion">Promotion</button>
                            <div id="promotionContent" class="content-section">

                            </div>

                            <button class="btn btn-primary mb-2" id="showAnnouncement">Announcement</button>
                            <div id="announcementContent" class="content-section">
                                <p>No announcements available.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid position-relative p-0">
    <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
        <a href="/" class="navbar-brand p-0">
            <h1 class="m-0"><i class="fa fa-map-marker-alt me-3"></i>Travela</h1>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="fa fa-bars"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto py-0">
                <a href="/" class="nav-item nav-link active">Home</a>
                <a href="/about" class="nav-item nav-link">About</a>
                <a href="/blog" class="nav-item nav-link">Blog</a>
            </div>
            <div class="rounded-pill py-2 px-4" style="margin-left: 0px;">
                <a id = "booking-button" href="#" role="button">
                    <span>Book now</span>
                    <div class="icon">
                        <i class="fa fa-remove"> <img src = "/images/user/airplane.png"> </i>
                    </div>
                    <div id="animation-container"></div>
                </a>
            </div>
        </div>
    </nav>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script>

    $(document).ready(function() {
        $.ajax({
            url: '/api/getAllPromotions', //URL của REST API
            method: 'GET',
            dataType: 'json',headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('accessToken')  // Lấy token từ localStorage
            },
            success: function(data) {
                console.log("3");
                $('#promotionContent').empty();
                // Duyệt qua danh sách và thêm mỗi model vào select
                $.each(data, function (index, promotion) {
                    $('#promotionContent').append('<a class="dropdown-item">' + promotion.title + '</a>');
                });
            },
            error: function(xhr, status, error) {
                if (xhr.status === 401) {
                    alert('Failed Login');
                    $('#loginError').show();
                } else {
                    console.log('Lỗi: ', status, error);
                }
            }
        });
    });
    // Prevent dropdown menu from closing on button click
    document.querySelectorAll('.dropdown-menu button').forEach(button => {
        button.addEventListener('click', (e) => {
            e.stopPropagation(); // Prevent dropdown from closing
        });
    });

    function toggleContent(buttonId, contentId) {
        const content = document.getElementById(contentId);

        // Check current state and toggle
        if (content.style.maxHeight === "0px" || !content.style.maxHeight) {
            content.style.maxHeight = content.scrollHeight + "px"; // Expand to full height
            content.style.paddingBottom = "10px";
        } else {
            content.style.maxHeight = "0px"; // Collapse to zero height
            content.style.paddingTop = "0px"; // Remove padding
            content.style.paddingBottom = "0px";
        }
    }


    // Event listener for Promotion button
    document.getElementById("showPromotion").addEventListener("click", function () {
        toggleContent("showPromotion", "promotionContent");
    });

    // Event listener for Announcement button
    document.getElementById("showAnnouncement").addEventListener("click", function () {
        toggleContent("showAnnouncement", "announcementContent");
    });


    // Prevent dropdown menu from closing on button click
    document.querySelectorAll('.dropdown-menu button').forEach(button => {
        button.addEventListener('click', (e) => {
            e.stopPropagation(); // Prevent dropdown from closing
        });
    });



    function closeNotificationBox() {
        document.getElementById('notificationBox').style.display = 'none';
    }

</script>
</body>
</html>
