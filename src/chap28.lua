--28.1  Array Manipulation
--lua_rawgeti, lua_rawseti æä¾äºä¸ç§å¿«æ·è®¿é®tableçæ¹æ³
--åæ°:state,index,key å¶ä¸­indexè¡¨ç¤ºtableå¨æ ä¸­çä½ç½®,keyè¡¨ç¤ºtableéçkey
--
--28.2 String Manipulation
--const char* lua_pushfstring(lua_State *L, const char *fmt, ...);

--28.3 Storing State in C Functions
--pseudo-indexæ¯æå¯ä»¥ç¨éindexçæ¹å¼æ¥è®¿é®æ 
--lua_getfield(L, LUA_REGISTRYINDEX, "key")
--å¨registryä¸­ç»ä¸è¦ç¨æ°å­åkey
--int r = luaL_ref(L, LUAREGISTRYINDEX)
--åå»ºä¸ä¸ªå¼ç¨,è¿åçrä»£è¡¨å¶æ°å­é®,è¿è¢«ç§°ä¸ºå¼ç¨
--å¨Cä¸­ä¸è½ä¿å­Luaä¸­å¯¹è±¡çæé,ä½å¯ä»¥ä¿å­ä»ä»¬çå¼ç¨
