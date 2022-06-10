<?php
    declare(strict_types = 1);
    
    require_once(__DIR__ . '/../utils/session.php');
?>

<?php function drawLoginSection() { ?>
    <section class="login-box cntr">
        <div class="intro d-block rel">
            <h3 class="h3">ALREADY HAVE AN ACCOUNT</h3>
            <span class="d-block lg">Login</span>
            <span class="d-block lighter">Insert details.</span>
            <div class="login-form">
                <div class="login-form-inner">
                    <div class="login-form-content">
                        <form action="../actions/action_login.php" class="form-search needs-validation" method="post">
                            <!-- <div class="err-login error-placer alert alert-danger">
                                This email is invalid
                            </div> -->
                            <div class="form-group was-validated">
                                <!-- required pattern="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$" -->
                                <input type="text" id="email" name="username" class="form-control form-control-filled" autocorrect="off" autocomplete="off" autocapitalize="off">
                                <label for="email" class="form-control-label">Insert your username</label>
                            </div>
                            <div class="form-group was-validated">
                                <input type="password" id="password" name="password" class="form-control form-control-filled" required autocorrect="off" autocapitalize="off" autocomplete="off">
                                <label for="password" class="form-control-label">Type your password</label>
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg login-submit-button" id="login-submit-button">Log-In</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
<?php } ?>

<?php function drawRegisterSection() { ?>
    <section class="register cntr">
        <div class="rel reg">
            <h3 class="h3">CREATE NEW ACCOUNT</h3>
            <span class="d-block lg">New User</span>
            <span class="d-block lighter">Create your user account to start ordering.</span>
            <div id="signup-container">
                <form action="test.php" class="form-search needs-validation" id="reg-form" autocomplete="off" method="post">
                    <div id="erur" class="err-signup error-placer alert alert-danger">
                        The email is invalid
                    </div>
                    <div class="form-group was-validated">
                        <input type="text" id="email_register" name="email_register" class="form-control form-control-filled" required pattern="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$" autocorrect="off" autocomplete="off" autocapitalize="off">
                        <label for="email_register" class="form-control-label">Insert your email</label>
                    </div>
                    <button type="button" id="cnt-btn" class="btn btn-primary btn-lg btn-block sign-up-button" onclick="changeRegister()">Continue</button>
                    <div class="form-group was-validated" id="after1">
                        <input type="text" id="nome" name="nome" class="form-control form-control-filled" required>
                        <label for="nome" class="form-control-label">Name</label>
                    </div>
                    <div class="form-group was-validated" id="after2">
                        <input type="password" id="password2" name="password2" class="form-control form-control-filled" required pattern=".{8,}" autocorrect="off" autocapitalize="off" autocomplete="off">
                        <label for="password2" class="form-control-label">Password</label>
                    </div>
                    <div class="form-group prvc-text" id="after3">
                        <p>
                            By creating an account, you accept the Privacy Politics and the Terms and Conditions of MyFood.
                        </p>
                    </div>
                    <input type="submit" id="after4" class="btn btn-primary btn-block btn-lg">
                </form>
                <section class="new-text" id="new-text">
                    <div class="column">
                        <h2 class="cntr">Advantages of creating an account</h2>
                        <ul>
                            <li>
                                <i class="check"></i>
                                Allows for favourite restaurants
                            </li>
                            <li>
                                <i class="check"></i>
                                Avoid filling in your information repeatedly
                            </li>
                            <li>
                                <i class="check"></i>
                                Allows safer and easier payment
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </div>
    </section>
<?php } ?>

<?php function drawInformation() { ?>
    <section class="info">
        <div class="info-text">
            <small>The fields followed by a * are mandatory.</small>
        </div>
    </section>
<?php } ?>