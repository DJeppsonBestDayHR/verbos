const CACHE='verbos-v10';
const FILES=['./','index.html','manifest.webmanifest','icon-192.png','icon-512.png','apple-touch-icon.png'];
self.addEventListener('install',e=>{e.waitUntil(caches.open(CACHE).then(c=>c.addAll(FILES)));self.skipWaiting()});
self.addEventListener('activate',e=>{e.waitUntil(caches.keys().then(ks=>Promise.all(ks.filter(k=>k!==CACHE).map(k=>caches.delete(k)))));self.clients.claim()});
// Network first so updates show up; fall back to the cache when offline.
self.addEventListener('fetch',e=>{if(e.request.method!=='GET')return;
  // Let audio clips go straight to the network: iPhone requests them in byte ranges, which a service worker can break.
  if(/\/audio\/[^/]+\.m4a$/.test(new URL(e.request.url).pathname))return;
  e.respondWith(fetch(e.request,{cache:'no-cache'}).then(r=>{if(r.status===200&&new URL(e.request.url).origin===location.origin){const c=r.clone();caches.open(CACHE).then(x=>x.put(e.request,c))}return r}).catch(()=>caches.match(e.request,{ignoreSearch:true})))});
