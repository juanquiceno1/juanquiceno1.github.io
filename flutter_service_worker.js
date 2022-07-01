'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "6dfbd941664e53f6173f53383139b86c",
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
"splash/style.css": "c35dd6bcdcb2c407b75fcff8979614f7",
"index.html": "18662397dddc3208238a9793cbba5d0f",
"/": "18662397dddc3208238a9793cbba5d0f",
"main.dart.js": "645857dd12597be22dbb37461c380f47",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "46e453a3d558f5da6368a76c3e7ac593",
"assets/AssetManifest.json": "080ecaa7b915d314bc18ddd04feb0ba4",
"assets/NOTICES": "22510f7d8e6acf892b955b6b53309daa",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/assets/splash/proservis-splashscreen_white.png": "33e9a2dca53801ba01c6068bc229dc19",
"assets/assets/splash/proservis-splashscreen.png": "f076302400db5abbdc0f4045d1294a5c",
"assets/assets/no-image.png": "acb907ceb1d75d6297681e6b0962777f",
"assets/assets/images/restore_password.png": "0199b4f582ebf3c2237bdbadba814e28",
"assets/assets/images/mail.png": "d40c14c97151c5a58b5e7f473bffabbb",
"assets/assets/images/selection.png": "f7df5d81c3ca963f6ee59844c376c0f4",
"assets/assets/images/alert.png": "5d1382923516924de4f631b3a7fae9aa",
"assets/assets/images/information.png": "1c3d372c790e8b48d5b9343c80a7959c",
"assets/assets/images/megaphone.png": "1ad3d887558b6b2c9bb8fa63f10c4ffb",
"assets/assets/images/account-executive.png": "f0eb24867b48b8f323b141ab08101887",
"assets/assets/images/recover_password.png": "54479ab756f44c10cd150a09517296a3",
"assets/assets/images/login_reset_password.svg": "683fd03bd535ce765529dd08b790c294",
"assets/assets/images/collaborators.png": "e3a82c9ffcf8aa27d4acf1ab9e0e38a9",
"assets/assets/images/hello.png": "c96d499c99b4881a7cefe0218f2a9810",
"assets/assets/images/call.png": "ef763e45e126dabfe72a6bef74b0f13c",
"assets/assets/images/next.png": "6ae75bcec77948ce7ce1509480cf3f32",
"assets/assets/images/login_reset_password.png": "504365c57e6960adc08bda6ebe317bf0",
"assets/assets/images/notification.png": "137a05727ca11b38b8e445df5e32bc11",
"assets/assets/loading.gif": "5c4d116857e0e776be224589c70e1a6e",
"assets/assets/green_logo.png": "9062a8d31c189496c863f0453751d50d",
"assets/assets/Logo-Proservis.png": "7e00b52e1eee1a9888343854c69c5509",
"assets/assets/green-rectangle.png": "5bd8e62ab00cde8f12fdb775a6dc7eb2",
"assets/assets/qr.png": "09fd26566ee346b5840b149279678a46",
"assets/assets/box-qr.png": "705c5f1b843605d8d1fec4686a70bf3c",
"assets/assets/icon/email.png": "15879f366a00f1df04760c9586758038",
"assets/assets/icon/active-contracts.png": "ee6aad176917298e203b0ed41bb60048",
"assets/assets/icon/check.png": "f46e849a15c224b752ac253a815caedc",
"assets/assets/icon/cite-candidates.png": "5a36d73a52407a21c1cdd02cb640fc33",
"assets/assets/icon/mail.png": "254728edb05fe9e3851656f06cbba7d1",
"assets/assets/icon/retired-contracts.png": "d04e03cd7e7b7cfdf065a43bbba1144a",
"assets/assets/icon/candidates.png": "706b17a0a0490178a0da67089a18d85e",
"assets/assets/icon/medical-exams.png": "98bdb4ddf443e0587b0a1cd10fce3fbd",
"assets/assets/icon/email.svg": "4451fee9421a9761be01ab4ca4300b9a",
"assets/assets/icon/search.png": "391904273b07ffeb9268ddab3a168131",
"assets/assets/icon/search-user.png": "3ff1c6a52ffbe60d2905971da48067e2",
"assets/assets/icon/state.png": "741e0bb59529712701f74f13cf5db567",
"assets/assets/icon/entry.png": "1a74ba266d45bf7c8389a33e94d7d7ec",
"assets/assets/icon/optional/active-contracts.png": "ee6aad176917298e203b0ed41bb60048",
"assets/assets/icon/optional/cite-candidates.png": "ad310f27b0a9b0a55dc6b665206a89ff",
"assets/assets/icon/optional/mail.png": "254728edb05fe9e3851656f06cbba7d1",
"assets/assets/icon/optional/retired-contracts.png": "d04e03cd7e7b7cfdf065a43bbba1144a",
"assets/assets/icon/optional/candidates.png": "e79386a9b426fd25884da1006d71eac4",
"assets/assets/icon/optional/medical-exams.png": "07c9138360fdbf0feebda3db89cb65f5",
"assets/assets/icon/optional/search.png": "391904273b07ffeb9268ddab3a168131",
"assets/assets/icon/optional/search-user.png": "3ff1c6a52ffbe60d2905971da48067e2",
"assets/assets/icon/optional/state.png": "741e0bb59529712701f74f13cf5db567",
"assets/assets/icon/optional/entry.png": "1a74ba266d45bf7c8389a33e94d7d7ec",
"assets/assets/icon/optional/phone.png": "cfece556bd8b69074de7d50bbb5818e8",
"assets/assets/icon/optional/report.png": "6fbfea6f8bb4674978e58ec81e0fc150",
"assets/assets/icon/optional/absenteeism.png": "6b064e9b1ff63e5a689998a30ee14b76",
"assets/assets/icon/points.png": "46cc15d790a092e3b0c4e195afa550dc",
"assets/assets/icon/filter.png": "26e3f03a324d60c48e3f63aa541eb634",
"assets/assets/icon/nit.png": "d57e2a77191a0bbf1f961f13a875ad58",
"assets/assets/icon/amy-contracts.png": "c5c2f7401f3b9aa330e10d56153878ec",
"assets/assets/icon/phone.png": "cfece556bd8b69074de7d50bbb5818e8",
"assets/assets/icon/google.png": "04ae934dd0e601e814eb3de841c4875b",
"assets/assets/icon/security.png": "fac705e4178115409916c3f4250c6469",
"assets/assets/icon/facebook.png": "6da7274265606ad38b8cd69f51de0f17",
"assets/assets/icon/chat.png": "d12166e3c5913842d0618cf069332b95",
"assets/assets/icon/report.png": "6fbfea6f8bb4674978e58ec81e0fc150",
"assets/assets/icon/absenteeism.png": "6b064e9b1ff63e5a689998a30ee14b76",
"assets/assets/jar-loading.gif": "a0a7f99bbe4eb3f98bc9c957d8dd1756",
"assets/assets/green_background_mid.png": "dadc6e83504a4e8c58b6dbe9c46ef20c",
"assets/assets/bottom_navigation_bar/perfil-verde.png": "e460fd0778afcb212ac192d2a576603f",
"assets/assets/bottom_navigation_bar/alert_on.png": "e1ec56493b2237ccf1f3ae11884b987f",
"assets/assets/bottom_navigation_bar/notification_on.png": "ef399bffe1f5198cf99de22072300566",
"assets/assets/bottom_navigation_bar/house_off1.png": "2e408a2ff4c83e9b2e54057fc3e82dee",
"assets/assets/bottom_navigation_bar/house_off.png": "81a2b2e1a443b7f7abc162c01a513fd8",
"assets/assets/bottom_navigation_bar/job_off_notification.png": "01b61cff04891ff1ea1e90622ae09325",
"assets/assets/bottom_navigation_bar/house_on.png": "9ae2e202f559542808a984d13d551e17",
"assets/assets/bottom_navigation_bar/jobs_on.png": "1d9cfb7274c334ad719dc0c805da9ed1",
"assets/assets/bottom_navigation_bar/avatar_off.png": "452ca9881aa844dce191d3be6b4f7dd5",
"assets/assets/bottom_navigation_bar/help_off.png": "75496272f1f6ebdc48055899f52aec60",
"assets/assets/bottom_navigation_bar/notification_off.png": "681da37a1d8e52521ab0add7b5ffe620",
"assets/assets/bottom_navigation_bar/help_on.png": "a31ae1a0cd159b5e7aadc85323f97ec6",
"assets/assets/bottom_navigation_bar/avatar_on.png": "febfb1da549943a06daa250db55ba653",
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
