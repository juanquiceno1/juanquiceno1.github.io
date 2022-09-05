'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "e046b892dfeecc08d8fa542393c41fd5",
"splash/img/light-2x.png": "1de7c9512220be2a75216af9f98d5c77",
"splash/img/dark-4x.png": "a9bc2969aa00a558c69b4f8540152c0e",
"splash/img/light-3x.png": "7d0f83beb2d8727882b4ef45c872a371",
"splash/img/dark-3x.png": "7d0f83beb2d8727882b4ef45c872a371",
"splash/img/light-background.png": "33e9a2dca53801ba01c6068bc229dc19",
"splash/img/light-4x.png": "a9bc2969aa00a558c69b4f8540152c0e",
"splash/img/dark-2x.png": "1de7c9512220be2a75216af9f98d5c77",
"splash/img/dark-1x.png": "9078b6d72e78a6bed0094a65cd40402e",
"splash/img/light-1x.png": "9078b6d72e78a6bed0094a65cd40402e",
"splash/splash.js": "c6a271349a0cd249bdb6d3c4d12f5dcf",
"splash/style.css": "8327a119a599f3bd070470049ad2e7e5",
"index.html": "6bc34207717eedf8dcf9b7a93e9a69cf",
"/": "6bc34207717eedf8dcf9b7a93e9a69cf",
"main.dart.js": "90a34c37e5329a13367ef646dbbd20ce",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "eef2fc01d976cf13b01a9fa64233b75e",
"assets/AssetManifest.json": "96bc987e81e06b2e7d138d988edff97f",
"assets/NOTICES": "6893ce2459243a160d2a0c1d2dc0485d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/splash/proservis-splashscreen_white.png": "33e9a2dca53801ba01c6068bc229dc19",
"assets/assets/splash/proservis-splashscreen.png": "f076302400db5abbdc0f4045d1294a5c",
"assets/assets/no-image.png": "acb907ceb1d75d6297681e6b0962777f",
"assets/assets/images/restore_password.png": "0199b4f582ebf3c2237bdbadba814e28",
"assets/assets/images/no_history.png": "2b1518873bf518ebbef44b53ead2ead1",
"assets/assets/images/recover_password.png": "54479ab756f44c10cd150a09517296a3",
"assets/assets/images/hello.png": "c96d499c99b4881a7cefe0218f2a9810",
"assets/assets/images/login_reset_password.png": "504365c57e6960adc08bda6ebe317bf0",
"assets/assets/loading.gif": "5c4d116857e0e776be224589c70e1a6e",
"assets/assets/green_logo.png": "9062a8d31c189496c863f0453751d50d",
"assets/assets/Logo-Proservis.png": "7e00b52e1eee1a9888343854c69c5509",
"assets/assets/green-rectangle.png": "5bd8e62ab00cde8f12fdb775a6dc7eb2",
"assets/assets/qr.png": "09fd26566ee346b5840b149279678a46",
"assets/assets/box-qr.png": "705c5f1b843605d8d1fec4686a70bf3c",
"assets/assets/icon/add_calendar.png": "47da397ece8086118184697b4e8383e3",
"assets/assets/icon/disabilities.png": "9ace11480d224c57bc2eb2e85507b0a1",
"assets/assets/icon/email.png": "15879f366a00f1df04760c9586758038",
"assets/assets/icon/check.png": "e94af75ae1b42bd31b3fc50995726869",
"assets/assets/icon/document.png": "8217bfe879eb68315349beefd33f64da",
"assets/assets/icon/home.svg": "4de3a9a0e83a92856dcd423f2df8a75e",
"assets/assets/icon/video_2.png": "82d1a4f951fb84c551b10b98b9d72612",
"assets/assets/icon/phone_number.png": "3589354900dfcf7d992264ba096860fb",
"assets/assets/icon/alert.png": "4c64ada6f25dd39d1ebd156ed851bbf0",
"assets/assets/icon/working_letter.png": "ce0fb773db83ed8de3df7e2001e81030",
"assets/assets/icon/collaborator.png": "22ce0fc89eb19fa699d245580dcaa9e2",
"assets/assets/icon/home.png": "cbf1816a4f96ca3147abc3ddb8e12842",
"assets/assets/icon/no_history.png": "2b1518873bf518ebbef44b53ead2ead1",
"assets/assets/icon/search.png": "391904273b07ffeb9268ddab3a168131",
"assets/assets/icon/certificates.png": "acff77af64bfd36122f8cfeb7a84f8da",
"assets/assets/icon/accident.png": "636a6ffbf48fe4d9a09bb5cda423da3e",
"assets/assets/icon/upload.png": "5303b6c3532bff034b983fd0e2d13db8",
"assets/assets/icon/points.png": "46cc15d790a092e3b0c4e195afa550dc",
"assets/assets/icon/filter.png": "26e3f03a324d60c48e3f63aa541eb634",
"assets/assets/icon/certificate_1.png": "de028ad45d349fe54846008469dc1833",
"assets/assets/icon/employees_%2520background.png": "7a9651c4ce7dac1a824bdf8c2e62bca5",
"assets/assets/icon/certificate_3.png": "563313aad0d182104a2de93dc9645689",
"assets/assets/icon/location.png": "68a63427a0c1ed53cca7943d255020bd",
"assets/assets/icon/phone.png": "cfece556bd8b69074de7d50bbb5818e8",
"assets/assets/icon/certificate_2.png": "db1b73a38cef29e2a64cf9349a0b5bde",
"assets/assets/icon/disabilities_4.png": "544af76b41ff284cdad6a71d2b7d0738",
"assets/assets/icon/job.png": "d73312351fa98423d6cf4d25a4209856",
"assets/assets/icon/google.png": "04ae934dd0e601e814eb3de841c4875b",
"assets/assets/icon/security.png": "fac705e4178115409916c3f4250c6469",
"assets/assets/icon/facebook.png": "6da7274265606ad38b8cd69f51de0f17",
"assets/assets/icon/camera.png": "139608ed44f77e488c0472e8769e8ce6",
"assets/assets/icon/cv.png": "addc6de2bff5ea6dc05991543b60b8ab",
"assets/assets/icon/notification.png": "137a05727ca11b38b8e445df5e32bc11",
"assets/assets/icon/chat.png": "d12166e3c5913842d0618cf069332b95",
"assets/assets/icon/contract.png": "8e3c263f5656a03bf444bc99687f44f7",
"assets/assets/icon/oclock.png": "62950221899c5b12054154759461f948",
"assets/assets/icon/text.png": "f4bbeea3e287eb946f71c84277597a7c",
"assets/assets/icon/ubication.png": "c8311db451e65590ef96b5d24c505e9c",
"assets/assets/jar-loading.gif": "a0a7f99bbe4eb3f98bc9c957d8dd1756",
"assets/assets/green_background_mid2.png": "1e884b374c0a4ac7bdafd642a14cc928",
"assets/assets/green_background_mid.png": "dadc6e83504a4e8c58b6dbe9c46ef20c",
"assets/assets/bottom_navigation_bar/notification_on.png": "ef399bffe1f5198cf99de22072300566",
"assets/assets/bottom_navigation_bar/house.png": "2e408a2ff4c83e9b2e54057fc3e82dee",
"assets/assets/bottom_navigation_bar/jobs_on.png": "1d9cfb7274c334ad719dc0c805da9ed1",
"assets/assets/bottom_navigation_bar/contact.png": "d5513c887f312abed66418642c750070",
"assets/assets/bottom_navigation_bar/avatar.png": "452ca9881aa844dce191d3be6b4f7dd5",
"assets/assets/bottom_navigation_bar/help.png": "75496272f1f6ebdc48055899f52aec60",
"assets/assets/bottom_navigation_bar/emergencies.png": "709b40407b69b5f88f514224dc95e49c",
"assets/assets/bottom_navigation_bar/notification_off.png": "681da37a1d8e52521ab0add7b5ffe620",
"assets/assets/bottom_navigation_bar/jobs.png": "3d6fa1cfd89017a9d858e0c61b367854",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
