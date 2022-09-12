'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "41c9d0057c7d4971457d261feb97b1e4",
"splash/img/light-2x.png": "02230cdb28165cac4c510a565029d78e",
"splash/img/dark-4x.png": "f63234a2a2e53584d402c9e8eb33645a",
"splash/img/light-3x.png": "cde991f7fd75434e40c7d1f9cf1ef985",
"splash/img/dark-3x.png": "cde991f7fd75434e40c7d1f9cf1ef985",
"splash/img/light-4x.png": "f63234a2a2e53584d402c9e8eb33645a",
"splash/img/dark-2x.png": "02230cdb28165cac4c510a565029d78e",
"splash/img/dark-1x.png": "27bae208b8b49a121b4b95e62d2fd877",
"splash/img/light-1x.png": "27bae208b8b49a121b4b95e62d2fd877",
"splash/splash.js": "123c400b58bea74c1305ca3ac966748d",
"splash/style.css": "305beab11b28d600c5a0134aa4168934",
"favicon.ico": "2ad0b2e913677b6679610ca6aa9c0846",
"index.html": "9d8c64c6f65a6db23793d0fa51fb6794",
"/": "9d8c64c6f65a6db23793d0fa51fb6794",
"main.dart.js": "4c66b56be0240457fcf5624e2adc41c0",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/icon-192.png": "030445a1cc97c03af66f6f037f2f3abc",
"icons/Icon-maskable-192.png": "59d8fc9d0780414572282cef8731ca3d",
"icons/Icon-maskable-512.png": "2e8f51449acafce6124e95aa2d2f17c8",
"icons/icon-512.png": "593ff9673f5eb2272c602c9ec04d7b74",
"manifest.json": "a73fc19ff099ab51d614d0630cb09682",
"assets/AssetManifest.json": "87a7a445ae7a164d0b2fcf45f6a15f60",
"assets/NOTICES": "6fbbb4c76d1d88d443e030c7d1b2bc97",
"assets/FontManifest.json": "721dc4933843e226aaf41ce15e7eafb3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/DiDi.png": "ec5bd8ce5ad1afdd3952a8b89adc064c",
"assets/assets/404-not-found.svg": "b2ef7c134afa4f5bdea9f0d0854d2a22",
"assets/assets/no-image.png": "acb907ceb1d75d6297681e6b0962777f",
"assets/assets/images/car/car_6.png": "71c5a9984f3ca119abbddefdea966eae",
"assets/assets/images/car/car_4.png": "f9076e684c6750dbb017aa8bed013171",
"assets/assets/images/car/car_5.png": "63b1a3e891d5c96511ef1f382b23ca67",
"assets/assets/images/car/car_1.png": "afcb5e1897bc16c6f35eb8e67b501358",
"assets/assets/images/car/car_2.png": "e44cae896deba91e49720df50e72090b",
"assets/assets/images/car/car_3.png": "39ffa805df30e61a779d27f24776db7b",
"assets/assets/images/backgroud_banner_movile.png": "5290aaa20f60b8f6d21c00aee6d2c425",
"assets/assets/images/backgroud_banner.png": "a60b44103858149930de2e67fd798f55",
"assets/assets/images/login_banner/banner_form.jpeg": "b5551ae3e539aa29fa3817b75e0123d6",
"assets/assets/images/login_banner/vector.png": "d4ce860a71f44963f08c2bba140c8e70",
"assets/assets/images/instagram.png": "74aa54012e1c97269bbe3e69d91095b0",
"assets/assets/images/user.png": "8abf4678bf7db2589d7c0047cc7f762f",
"assets/assets/images/driver.png": "18e7345d82d764df5d00191e30d27b9c",
"assets/assets/images/app_gallery.png": "0b62b135112a92b5ddf69b42b48d068b",
"assets/assets/images/play_store.png": "99e1d6ce624e6cff6f13c205e8abe84a",
"assets/assets/images/youtube.png": "6820607fab650ff7dcf9f95c37f4e02f",
"assets/assets/images/facebook.png": "ad8d349b15e3f9488b669713b7943666",
"assets/assets/images/app_store.png": "9017d68ef5b979f85ae49c4da3eec59f",
"assets/assets/logo.png": "9767105b85adc720747153e2ed3139a0",
"assets/assets/404-no-found.svg": "ba12ae9a59f9bdae2559fdd67e497236",
"assets/assets/logo_icons.png": "2e8f51449acafce6124e95aa2d2f17c8",
"assets/assets/fonts/aspira/Aspira-Bold.otf": "367a0f7be5624de35498b2af1b5d5864",
"assets/assets/fonts/aspira/Aspira-Regular.otf": "7ff70643804e5a751a56a4efdce38b87",
"assets/assets/fonts/aspira/aspira-demi.otf": "47c7531d41bf6447928663e568513479",
"assets/assets/fonts/aspira/Aspira-Medium.otf": "f93e75ac242f0be23dbe8e345046c881",
"assets/assets/fonts/aspira/Aspira-Light.otf": "b5a4a5fe329c612702560efca70f6052",
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
