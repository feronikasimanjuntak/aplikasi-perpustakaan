$("body").on("contextmenu", "img", function (e) {
    return false;
});
$('img').attr('draggable', false);
$(document).ready(function () {
    $(window).keydown(function (event) {
        if (event.keyCode == 13) {
            event.preventDefault();
        }
    });
});
$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});
function auth_content(cont) {
    $('#login_page').hide();
    $('#register_page').hide();
    $('#' + cont).show();
}
$("#form_login").on('keydown', 'input', function (event) {
    if (event.which == 13) {
        event.preventDefault();
        var $this = $(event.target);
        var index = parseFloat($this.attr('data-login'));
        var val = $($this).val();
        if (val == 1) {
            $('[data-login="' + (index + 1).toString() + '"]').focus();
        } else {
            $('#tombol_login').trigger("click");
        }
    }
});
var KTSigninGeneral = (function () {
    var e, t, i;
    return {
        init: function () {
            (e = document.querySelector("#form_login")),
                (t = document.querySelector("#tombol_login")),
                (i = FormValidation.formValidation(e, {
                    fields: {
                        email: { validators: { notEmpty: { message: "Alamat email diperlukan" }, emailAddress: { message: "Email tidak valid" } } },
                        password: {
                            validators: {
                                notEmpty: { message: "Password diperlukan" },
                                callback: {
                                    message: "Tolong masukkan password yang valid",
                                    callback: function (e) {
                                        if (e.value.length > 8) return _validatePassword();
                                    },
                                },
                            },
                        },
                    },
                    plugins: { trigger: new FormValidation.plugins.Trigger(), bootstrap: new FormValidation.plugins.Bootstrap5({ rowSelector: ".fv-row", eleInvalidClass: "", eleValidClass: "" }) },
                })),
                t.addEventListener("click", function (n) {
                    n.preventDefault(),
                        i.validate().then(function (i) {
                            login_data = {
                                email: $("#email_login").val(),
                                password: $("#password_login").val()
                            };
                            if (i == "Valid") {
                                t.setAttribute("data-kt-indicator", "on"), (t.disabled = !0);
                                $.ajax({
                                    type: "POST",
                                    url: "auth/login",
                                    data: login_data,
                                    dataType: 'json',
                                    success: function (response) {
                                        if (response.alert == "success") {
                                            setTimeout(function (_callback) {
                                                t.removeAttribute("data-kt-indicator"),
                                                    (t.disabled = !1),
                                                    Swal.fire({ text: response.message, icon: "success", buttonsStyling: !1, confirmButtonText: "Baik, Mengerti!", customClass: { confirmButton: "btn btn-primary" } }).then(function (t) {
                                                        t.isConfirmed && (e.reset());
                                                    }).then(function () {
                                                        window.location.replace(document.referrer)
                                                    });
                                            }, 2e3);
                                        } else {
                                            setTimeout(function () {
                                                t.removeAttribute("data-kt-indicator"),
                                                    (t.disabled = !1),
                                                    Swal.fire({ text: response.message, icon: "error", buttonsStyling: !1, confirmButtonText: "Baik, Mengerti!", customClass: { confirmButton: "btn btn-primary" } }).then(function (t) {
                                                    });
                                            }, 2e3);
                                        }
                                    }
                                });
                            } else {
                                t.removeAttribute("data-kt-indicator"), (t.disabled = !1);
                                Swal.fire({
                                    text: "Maaf! Sepertinya terdapat kesalahan. Tolong coba kembali!",
                                    icon: "error",
                                    buttonsStyling: !1,
                                    confirmButtonText: "Baik, Mengerti!",
                                    customClass: { confirmButton: "btn btn-primary" },
                                });
                            }
                        });
                });
        },
    };
})();

KTUtil.onDOMContentLoaded(function () {
    KTSigninGeneral.init();
});
KTUtil.onDOMContentLoaded(function () {
    KTSignupGeneral.init();
});

KTUtil.onDOMContentLoaded(function () {
    KTPasswordResetGeneral.init();
});
function handle_save(tombol, form, url, method){
    $(tombol).submit(function () {
        return false;
    });
    let data = $(form).serialize();
    $(tombol).prop("disabled", true);
    $(tombol).html("Please wait");
    $.ajax({
        type: method,
        url: url,
        data: data,
        dataType: 'json',
        beforeSend: function() {

        },
        success: function (response) {
            if (response.alert=="success") {
                Swal.fire({ text: response.message, icon: "success", buttonsStyling: !1, confirmButtonText: "Baik, Mengerti!", customClass: { confirmButton: "btn btn-primary" } }).then(function (t) {
                    $(form)[0].reset();
                    setTimeout(function () {
                        $(tombol).prop("disabled", false);
                        $(tombol).html('Mohon tunggu');
                        location.href = response.route;
                    }, 2000);
                });
            } else {
                Swal.fire({ text: response.message, icon: "error", buttonsStyling: !1, confirmButtonText: "Baik, Mengerti!", customClass: { confirmButton: "btn btn-primary" } }).then(function (t) {
                    setTimeout(function () {
                        $(tombol).prop("disabled", false);
                        $(tombol).html('Mohon tunggu');
                    }, 2000);
                });
            }
        },
    });
}
