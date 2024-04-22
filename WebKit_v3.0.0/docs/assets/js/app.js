/**
* Theme: TechUI - Responsive Bootstrap 5 Admin Dashboard
* Author: GetAppui
* Module/App: Main Js
*/


(function ($) {

    'use strict';

    // Bootstrap Components
    function initComponents() {

        // loader - Preloader
        $(window).on('load', function () {
            $('#status').fadeOut();
            $('#preloader').delay(350).fadeOut('slow');
        });

        // Popovers
        const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
        const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))

        // Tooltips
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

        // offcanvas
        const offcanvasElementList = document.querySelectorAll('.offcanvas')
        const offcanvasList = [...offcanvasElementList].map(offcanvasEl => new bootstrap.Offcanvas(offcanvasEl))

        //Toasts
        var toastPlacement = document.getElementById("toastPlacement");
        if (toastPlacement) {
            document.getElementById("selectToastPlacement").addEventListener("change", function () {
                if (!toastPlacement.dataset.originalClass) {
                    toastPlacement.dataset.originalClass = toastPlacement.className;
                }
                toastPlacement.className = toastPlacement.dataset.originalClass + " " + this.value;
            });
        }

        // Feather Icons
        feather.replace()
    }



    function init() {
        initComponents();
    }

    init();

})(jQuery)
/**
* Theme: TechUI - Responsive Bootstrap 5 Admin Dashboard
* Author: GetAppui
* Module/App: Layout Js
*/

class ThemeCustomizer {

    constructor() {
        this.html = document.getElementsByTagName('html')[0]
        this.config = {};
        this.defaultConfig = window.config;
    }

    initConfig() {
        this.defaultConfig = JSON.parse(JSON.stringify(window.defaultConfig));
        this.config = JSON.parse(JSON.stringify(window.config));
        this.setSwitchFromConfig();
    }

    // Left Sidebar Menu (Vertical Menu)
    initLeftSidebar() {
        var self = this;

        if ($(".menu").length) {
            var navCollapse = $('.menu li .collapse');
            var navToggle = $(".menu li [data-bs-toggle='collapse']");
            navToggle.on('click', function (e) {
                return false;
            });

            // open one menu at a time only
            navCollapse.on({
                'show.bs.collapse': function (event) {
                    var parent = $(event.target).parents('.collapse.show');
                    $('.menu .collapse.show').not(event.target).not(parent).collapse('hide');
                }
            });

            // activate the menu in left side bar (Vertical Menu) based on url
            $(".menu a").each(function () {
                var pageUrl = window.location.href.split(/[?#]/)[0];
                if (this.href == pageUrl) {
                    $(this).addClass("active");
                    $(this).parent().addClass("menuitem-active");
                    $(this).parent().parent().parent().addClass("show");
                    $(this).parent().parent().parent().parent().addClass("menuitem-active");
                    $(this).parent().parent().parent().parent().parent().parent().parent().addClass("menuitem-active");

                    var firstLevelParent = $(this).parent().parent().parent().parent().parent().parent();
                    if (firstLevelParent.attr('id') !== 'sidebar-menu') firstLevelParent.addClass("show");

                    var secondLevelParent = $(this).parent().parent().parent().parent().parent().parent().parent().parent().parent();
                    if (secondLevelParent.attr('id') !== 'wrapper') secondLevelParent.addClass("show");

                    var upperLevelParent = $(this).parent().parent().parent().parent().parent().parent().parent().parent().parent().parent();
                    if (!upperLevelParent.is('body')) upperLevelParent.addClass("menuitem-active");
                }
            });
        }

        setTimeout(function () {
            var activatedItem = document.querySelector('li.menuitem-active .active');
            if (activatedItem != null) {
                var simplebarContent = document.querySelector('.app-sidenav .simplebar-content-wrapper');
                var offset = activatedItem.offsetTop - 300;
                if (simplebarContent && offset > 100) {
                    scrollTo(simplebarContent, offset, 600);
                }
            }
        }, 200);

        // scrollTo (Left Side Bar Active Menu)
        function easeInOutQuad(t, b, c, d) {
            t /= d / 2;
            if (t < 1) return c / 2 * t * t + b;
            t--;
            return -c / 2 * (t * (t - 2) - 1) + b;
        }
        function scrollTo(element, to, duration) {
            var start = element.scrollTop, change = to - start, currentTime = 0, increment = 20;
            var animateScroll = function () {
                currentTime += increment;
                var val = easeInOutQuad(currentTime, start, change, duration);
                element.scrollTop = val;
                if (currentTime < duration) {
                    setTimeout(animateScroll, increment);
                }
            };
            animateScroll();
        }
    }

    reverseQuery(element, query) {
        while (element) {
            if (element.parentElement) {
                if (element.parentElement.querySelector(query) === element) return element
            }
            element = element.parentElement;
        }
        return null;
    }

    changeThemeMode(color) {
        this.config.theme = color;
        this.html.setAttribute('data-bs-theme', color);
        this.setSwitchFromConfig();
    }

    changeLayoutMode(mode, save = true) {
        this.html.setAttribute('data-layout-mode', mode);
        if (save) {
            this.config.layout.mode = mode;
            this.setSwitchFromConfig();
        }
    }

    changeSidenavColor(color) {
        this.config.sidenav.color = color;
        this.html.setAttribute('data-sidenav-color', color);
        this.setSwitchFromConfig();
    }

    changeSidenavSize(size, save = true) {
        this.html.setAttribute('data-sidenav-size', size);
        if (save) {
            this.config.sidenav.size = size;
            this.setSwitchFromConfig();
        }
    }

    changeTopbarColor(color) {
        this.config.topbar.color = color;
        this.html.setAttribute('data-topbar-color', color);
        this.setSwitchFromConfig();
    }

    resetTheme() {
        this.config = JSON.parse(JSON.stringify(window.defaultConfig));
        this.changeThemeMode(this.config.theme);
        this.changeLayoutMode(this.config.layout.mode);
        this.changeSidenavColor(this.config.sidenav.color);
        this.changeTopbarColor(this.config.topbar.color);
        this.changeSidenavSize(this.config.sidenav.size);
        this.adjustLayout();
    }

    initSwitchListener() {
        var self = this;

        document.querySelectorAll('input[name=data-bs-theme]').forEach(function (element) {
            element.addEventListener('change', function (e) {
                self.changeThemeMode(element.value);
            })
        });

        document.querySelectorAll('input[name=data-sidenav-color]').forEach(function (element) {
            element.addEventListener('change', function (e) {
                self.changeSidenavColor(element.value);
            })
        });

        document.querySelectorAll('input[name=data-sidenav-size]').forEach(function (element) {
            element.addEventListener('change', function (e) {
                self.changeSidenavSize(element.value);
            })
        });

        document.querySelectorAll('input[name=data-layout-mode]').forEach(function (element) {
            element.addEventListener('change', function (e) {
                self.changeLayoutMode(element.value);
            })
        });

        document.querySelectorAll('input[name=data-topbar-color]').forEach(function (element) {
            element.addEventListener('change', function (e) {
                self.changeTopbarColor(element.value);
            })
        });

        //TopBar Light Dark
        var themeColorToggle = document.getElementById('light-dark-mode');
        if (themeColorToggle) {
            themeColorToggle.addEventListener('click', function (e) {

                if (self.config.theme === 'light') {
                    self.changeThemeMode('dark');
                } else {
                    self.changeThemeMode('light');
                }
            });
        }

        var resetBtn = document.querySelector('#reset-layout')
        if (resetBtn) {
            resetBtn.addEventListener('click', function (e) {
                self.resetTheme();
            });
        }

        var menuToggleBtn = document.querySelector('.button-toggle-menu');
        if (menuToggleBtn) {
            menuToggleBtn.addEventListener('click', function () {
                var configSize = self.config.sidenav.size;
                var size = self.html.getAttribute('data-sidenav-size', configSize);

                if (size === 'overlay') {
                    self.showBackdrop();
                } else {
                    if (configSize == 'hidden') {
                        if (size === 'hidden') {
                            self.changeSidenavSize(configSize == 'hidden' ? 'default' : configSize, false);
                        } else {
                            self.changeSidenavSize('hidden', false);
                        }
                    } else {
                        if (size === 'sm') {
                            self.changeSidenavSize(configSize == 'sm' ? 'default' : configSize, false);
                        } else {
                            self.changeSidenavSize('sm', false);
                        }
                    }
                }

                self.html.classList.toggle('sidebar-enable');
            });
        }
    }

    showBackdrop() {
        const backdrop = document.createElement('div');
        backdrop.id = 'custom-backdrop';
        backdrop.classList = 'offcanvas-backdrop fade show';
        document.body.appendChild(backdrop);
      
        if (document.getElementsByTagName('html')[0]?.getAttribute('dir') != 'rtl') {
            document.body.style.overflow = "hidden";
            if (window.innerWidth > 1140) {
                document.body.style.paddingRight = "15px";
            }
        }
        const self = this
        backdrop.addEventListener('click', function (e) {
            self.html.classList.remove('sidebar-enable');
            self.hideBackdrop();
        })
    }

    hideBackdrop() {
        var backdrop = document.getElementById('custom-backdrop');
        if (backdrop) {
            document.body.removeChild(backdrop);
            document.body.style.overflow = null;
            document.body.style.paddingRight = null;
        }
    }

    initWindowSize() {
        var self = this;
        window.addEventListener('resize', function (e) {
            self.adjustLayout();
        })
    }

    adjustLayout() {
        var self = this;

        if (window.innerWidth <= 1140) {
            self.changeSidenavSize('overlay', false);
        } else {
            self.changeSidenavSize(self.config.sidenav.size);
        }
    }

    setSwitchFromConfig() {

        sessionStorage.setItem('__TECHUI_CONFIG__', JSON.stringify(this.config));
        // localStorage.setItem('__TECHUI_CONFIG__', JSON.stringify(this.config));

        document.querySelectorAll('#theme-settings-offcanvas input[type=radio]').forEach(function (radio) {
            radio.checked = false;
        })

        var config = this.config;
        if (config) {
            var layoutColorSwitch = document.querySelector('input[type=radio][name=data-bs-theme][value=' + config.theme + ']');
            var layoutModeSwitch = document.querySelector('input[type=radio][name=data-layout-mode][value=' + config.layout.mode + ']');
            var topbarColorSwitch = document.querySelector('input[type=radio][name=data-topbar-color][value=' + config.topbar.color + ']');
            var sidenavColorSwitch = document.querySelector('input[type=radio][name=data-sidenav-color][value=' + config.sidenav.color + ']');
            var sidenavSizeSwitch = document.querySelector('input[type=radio][name=data-sidenav-size][value=' + config.sidenav.size + ']');

            if (layoutColorSwitch) layoutColorSwitch.checked = true;
            if (layoutModeSwitch) layoutModeSwitch.checked = true;
            if (topbarColorSwitch) topbarColorSwitch.checked = true;
            if (sidenavColorSwitch) sidenavColorSwitch.checked = true;
            if (sidenavSizeSwitch) sidenavSizeSwitch.checked = true;
        }
    }


    init() {
        this.initConfig();
        this.initLeftSidebar();
        this.initSwitchListener();
        this.initWindowSize();
        this.adjustLayout();
        this.setSwitchFromConfig();
    }
}

new ThemeCustomizer().init();