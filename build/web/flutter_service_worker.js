'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "886d11c3dca41dfc282427996b971dbd",
"assets/AssetManifest.bin.json": "74530cc4586ed54224d0b4f7994e319f",
"assets/AssetManifest.json": "94639539e05aec73ca929a56c8dbc407",
"assets/assets/icons/app_development.png": "e94e1bba0bd31fb14b559a1b050b461f",
"assets/assets/icons/c++.png": "914a89751ad6fd57e69702ec1fd5ffd1",
"assets/assets/icons/contact.png": "5462b19bd611cc4693bf8c1102c8dd49",
"assets/assets/icons/css.png": "267ee78f496bd6901b6d1ce212dad919",
"assets/assets/icons/dart.png": "95e33383a01344c56d91bfa0db530627",
"assets/assets/icons/education.png": "f251ee54fc3c5e35f86bb48bc9bd46a5",
"assets/assets/icons/experience.png": "dd3b76de9fa31543003a983dab430267",
"assets/assets/icons/express_js.png": "b19c668e7f1bf3a702b2f3f985def71b",
"assets/assets/icons/flutter.png": "c315fbdd867d6446f7fbb299ab780e74",
"assets/assets/icons/git.png": "fb2df08c3d258975ab20b21b4c9f6896",
"assets/assets/icons/github.png": "14eb2fb8a1610d5822bf4bad53c88120",
"assets/assets/icons/home.png": "3908d12ddb406a36b2cbc9900ed81703",
"assets/assets/icons/html.png": "7a9edc32bc23c54ec39c6d503f901b12",
"assets/assets/icons/javascript.png": "71401ef3da26b65f843426eb915c48a7",
"assets/assets/icons/linkedin.png": "4b0b25b7c7f899c46b3490e02478b4d4",
"assets/assets/icons/mail.png": "5c7c786cf45bee2d9038f7ef383bf5fc",
"assets/assets/icons/mongodb.png": "3c23d2c94cb4fca31845d025a9d8ec70",
"assets/assets/icons/node_js.png": "335529779e06d57c5775f4695d90f442",
"assets/assets/icons/oops.png": "6b93c8309311e54bf4cd72e5d22c86d0",
"assets/assets/icons/phone-call.png": "8db6dffd5afb3f3ec7220788e5fb180e",
"assets/assets/icons/phone_call.png": "d3c2f41dfe9bc4a104e13c389ed1298a",
"assets/assets/icons/projects.png": "f51fba1bcda382971f2219537cf3f71a",
"assets/assets/icons/react_js.png": "2198f884fddf4629ab3df281ae2c77c6",
"assets/assets/icons/resume.png": "bdbc3fc07f17095995e8a731cf3bfe78",
"assets/assets/icons/skills.png": "6ff28aa46ef1a4c410468c2e3c401d9e",
"assets/assets/icons/web_development.png": "67d7fe7c09ff8f776c09d2dd3872b44d",
"assets/assets/images/api/api_1.png": "84b5cbe931509918427d54eabf3f31c0",
"assets/assets/images/api/api_10.png": "1271814a7e6fa1543e98770d7aabcee4",
"assets/assets/images/api/api_2.png": "60cca2fe498b13c81f62fcdf99b874a6",
"assets/assets/images/api/api_3.png": "02d37c7b32322aae6354aa2aaaecb0c3",
"assets/assets/images/api/api_4.png": "b8da738d79d91f81aecddaaceb9de12a",
"assets/assets/images/api/api_5.png": "78b2ccbd0d3dd9174087f49f3a674f4b",
"assets/assets/images/api/api_6.png": "3cf0a07c51481938fc753bac78165e55",
"assets/assets/images/api/api_7.png": "390cde626757879c901b0efa1f265714",
"assets/assets/images/api/api_8.png": "8aad67c26aabb67c24f148f150ad4ddf",
"assets/assets/images/api/api_9.png": "b6802df8772b662debd1f8d80c7027b5",
"assets/assets/images/ecom/ecom_1.png": "95d91592fd19c7f5862a63099f2f7ed4",
"assets/assets/images/ecom/ecom_10.png": "158bd65790d7607a7c658bb6d30deee0",
"assets/assets/images/ecom/ecom_11.png": "863edc7f1ad6d1c4524dd565730859c9",
"assets/assets/images/ecom/ecom_12.png": "c36d9f76206df35946deae9003ad6338",
"assets/assets/images/ecom/ecom_13.png": "a009d96ef7548449c466f7e7490e0f5c",
"assets/assets/images/ecom/ecom_14.png": "d35116504817de932c0a9efa29153f78",
"assets/assets/images/ecom/ecom_15.png": "70eec7ecd3a0b383d7374868c3483ff9",
"assets/assets/images/ecom/ecom_16.png": "4848a140544637c6ebab85f8ac06b3d1",
"assets/assets/images/ecom/ecom_17.png": "f201e9dc8d955d2218554a9c04b21c1d",
"assets/assets/images/ecom/ecom_18.png": "27e41d4fdb40e5a70cb816dcd027d181",
"assets/assets/images/ecom/ecom_19.png": "e3a78af0aa8d359adc2ef4da0e2107f0",
"assets/assets/images/ecom/ecom_2.png": "7bf90eec840aa33af16b16afc1563720",
"assets/assets/images/ecom/ecom_20.png": "7ba49801c5acc9af0f17b41f2875063d",
"assets/assets/images/ecom/ecom_3.png": "d11dd8977f31328db9c228030b88887a",
"assets/assets/images/ecom/ecom_4.png": "465a6aea6b4f9af8e88f61d22e086bd3",
"assets/assets/images/ecom/ecom_5.png": "a5c733f6e9d2f06c21813aa27325a649",
"assets/assets/images/ecom/ecom_6.png": "1d87d945e3abf2d2b93101b82bba275c",
"assets/assets/images/ecom/ecom_7.png": "7ebc10cfb9b6918ad3dfc662ad2bbd70",
"assets/assets/images/ecom/ecom_8.png": "2dba4d2157a1737ad8747ff3d704ed30",
"assets/assets/images/ecom/ecom_9.png": "02feb73b146ff60ad7739649caa6c035",
"assets/assets/images/portfolio_img/portfolio_1.png": "31603c949e247d421ede51f4838da83f",
"assets/assets/images/portfolio_img/portfolio_2.png": "22bc4e4f1405b46fcef4c792524322e7",
"assets/assets/images/portfolio_img/portfolio_3.png": "d024209b8ba43117380093f529808b8a",
"assets/assets/images/portfolio_img/portfolio_4.png": "77f111ee591276b3e2719ad025e2450f",
"assets/assets/images/portfolio_img/portfolio_5.png": "9b95d6ac331f115542f6224c1ca9ed07",
"assets/assets/images/portfolio_img/portfolio_6.png": "0c701003ad9189fb91e36d727872424c",
"assets/assets/images/portfolio_img/portfolio_7.png": "558a024c131879c8b575035aa86849ae",
"assets/assets/images/user.jpg": "ecd9eab41e1d60568d814eb1be6b047c",
"assets/assets/pdf/Ankit-Resume.pdf": "3539b69b035ed1a517a3eb2ed58e41be",
"assets/FontManifest.json": "7df10702a8c60a62e6694f43081d46e7",
"assets/fonts/MaterialIcons-Regular.otf": "8fc0bdcef39ca6368eee4ee4acc6ae38",
"assets/NOTICES": "5dde18be6a7cb85535f4eb50bf0abf16",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/iconsax_flutter/fonts/FlutterIconsax.ttf": "83c878235f9c448928034fe5bcba1c8a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "0685f88687e49342235dcc28f76f560e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "cfdea1e0751226c00110ca3b6fbc3552",
"/": "cfdea1e0751226c00110ca3b6fbc3552",
"main.dart.js": "9e10d1e41146cba70951c17e54dd3f9e",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006",
"web_logo.png": "65cafbb6b0b567d9642a89bc7b0e3149"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
