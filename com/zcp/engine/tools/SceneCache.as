package com.zcp.engine.tools
{
   import com.zcp.common.cache.Cache;
   import com.zcp.common.handler.HandlerThread;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.SceneRender;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.staticdata.AvatarPartID;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarImgData;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.avatar.AvatarPartStatus;
   import com.zcp.engine.vo.avatar.AvatarPartStatusList;
   import com.zcp.engine.vo.avatar.AvatarPlayCondition;
   import com.zcp.manager.CacheManager;
   import com.zcp.manager.RslLoaderManager;
   
   public class SceneCache
   {
      
      private static var LOAD_AVATAR_DELAY:int = 0;
      
      private static var ADD_AVATAR_DELAY:int = 0;
      
      public static const UNINSTALL_DELAY_TIME:int = 120000;
      
      public static var transports:Object = {};
      
      public static var mapZones:Object = {};
      
      public static var currentMapZones:Object = {};
      
      public static var mapImgCache:Cache = CacheManager.creatNewCache("mapImgCache");
      
      public static var mapTiles:Object = {};
      
      private static var waitingLoadAvatarHT:HandlerThread = new HandlerThread();
      
      private static var waitingLoadAvatarFun:Object = new Object();
      
      private static var waitingLoadAvatars:Object = new Object();
      
      private static var waitingAddAvatarHT:HandlerThread = new HandlerThread();
      
      private static var waitingAddAvatars:Array = [];
      
      public static var avatarXmlCache:Cache = CacheManager.creatNewCache("avatarXmlCache");
      
      private static var avatarImgCache:Cache = CacheManager.creatNewCache("avatarImgCache");
      
      public static var waitingRemoveAvatarImgs:Object = {};
      
      private static var count:int = 0;
      
      public function SceneCache()
      {
         super();
      }
      
      public static function addWaitingLoadAvatar(param1:SceneCharacter, param2:AvatarParamData, param3:Function = null) : void
      {
         var _loc5_:Boolean = false;
         var _loc6_:Array = null;
         if(!param1.usable)
         {
            return;
         }
         var _loc4_:Array = waitingLoadAvatars[param2.sourcePath];
         if(_loc4_ == null)
         {
            waitingLoadAvatars[param2.sourcePath] = [[param1,param2]];
         }
         else
         {
            for each(_loc6_ in _loc4_)
            {
               if(param1 == _loc6_[0] && param1.id == _loc6_[0].id && param2.sourcePath == _loc6_[1].sourcePath)
               {
                  _loc5_ = true;
                  break;
               }
            }
            if(!_loc5_)
            {
               waitingLoadAvatars[param2.sourcePath].push([param1,param2]);
            }
         }
         if(param3 != null)
         {
            waitingLoadAvatarFun[param2.sourcePath] = param3;
            waitingLoadAvatarHT.push(param3,null,LOAD_AVATAR_DELAY,true,true,param1.isMainChar());
         }
      }
      
      public static function addWaitingAddAvatar(param1:SceneCharacter, param2:AvatarParamData, param3:AvatarPartStatusList) : void
      {
         var type:int = 0;
         var id:int = 0;
         var arr:Array = null;
         var ht_addAvatarPart:Function = null;
         var $in_sc:SceneCharacter = param1;
         var $in_apd:AvatarParamData = param2;
         var $in_apsList:AvatarPartStatusList = param3;
         ht_addAvatarPart = function():void
         {
            var _loc1_:int = waitingAddAvatars.indexOf(arr);
            if(_loc1_ != -1)
            {
               waitingAddAvatars.splice(_loc1_,1);
               if($in_sc.usable && $in_sc.type == type && $in_sc.id == id)
               {
                  addAvatarPart($in_sc,$in_apd,$in_apsList);
               }
            }
         };
         if(!$in_sc.usable)
         {
            return;
         }
         type = $in_sc.type;
         id = $in_sc.id;
         arr = [$in_sc,$in_apd,ht_addAvatarPart];
         waitingAddAvatars.push(arr);
         waitingAddAvatarHT.push(ht_addAvatarPart,null,ADD_AVATAR_DELAY,true,true,$in_sc.isMainChar());
      }
      
      public static function removeWaitingAvatar(param1:SceneCharacter = null, param2:String = null, param3:String = null, param4:Array = null) : void
      {
         var watingArrKey:String = null;
         var watingArr:Array = null;
         var loadFun:Function = null;
         var arr1:Array = null;
         var len:int = 0;
         var newWatingArr:Array = null;
         var arr:Array = null;
         var sc:SceneCharacter = null;
         var apd:AvatarParamData = null;
         var sc1:SceneCharacter = null;
         var apd1:AvatarParamData = null;
         var addFun:Function = null;
         var $in_sc:SceneCharacter = param1;
         var $in_avatarPartID:String = param2;
         var $in_avatarPartType:String = param3;
         var $except_char_arr:Array = param4;
         var removeWaitLoadFun:Function = function(param1:String):void
         {
            var _loc2_:Function = waitingLoadAvatarFun[param1];
            if(_loc2_ != null)
            {
               waitingLoadAvatarHT.removeHandler(_loc2_);
            }
         };
         for(watingArrKey in waitingLoadAvatars)
         {
            watingArr = waitingLoadAvatars[watingArrKey];
            if(watingArr != null && watingArr.length > 0)
            {
               newWatingArr = [];
               for each(arr in watingArr)
               {
                  sc = arr[0] as SceneCharacter;
                  if(sc.usable)
                  {
                     apd = arr[1] as AvatarParamData;
                     if(AvatarPartID.isDefaultKey(apd.id) || $except_char_arr != null && $except_char_arr.indexOf(sc) != -1 || !(($in_sc == null || sc == $in_sc && sc.id == $in_sc.id) && ($in_avatarPartID == null || apd.id == $in_avatarPartID) && ($in_avatarPartType == null || apd.type == $in_avatarPartType)))
                     {
                        newWatingArr.push(arr);
                     }
                     else
                     {
                        apd.executeCallBack(sc);
                     }
                  }
               }
               if(newWatingArr.length > 0)
               {
                  waitingLoadAvatars[watingArrKey] = newWatingArr;
               }
               else
               {
                  delete waitingLoadAvatars[watingArrKey];
                  removeWaitLoadFun(watingArrKey);
                  RslLoaderManager.cancelLoadByUrl(watingArrKey);
               }
            }
            else
            {
               delete waitingLoadAvatars[watingArrKey];
               removeWaitLoadFun(watingArrKey);
               RslLoaderManager.cancelLoadByUrl(watingArrKey);
            }
         }
         len = int(waitingAddAvatars.length);
         while(len-- > 0)
         {
            arr1 = waitingAddAvatars[len];
            sc1 = arr1[0];
            apd1 = arr1[1];
            addFun = arr1[2];
            if(!(sc1.usable && ($except_char_arr != null && $except_char_arr.indexOf(sc1) != -1 || !(($in_sc == null || sc1 == $in_sc && sc1.id == $in_sc.id) && ($in_avatarPartID == null || apd1.id == $in_avatarPartID) && ($in_avatarPartType == null || apd1.type == $in_avatarPartType)))))
            {
               waitingAddAvatars.splice(len,1);
               waitingAddAvatarHT.removeHandler(addFun);
            }
         }
      }
      
      public static function dowithWaiting(param1:String, param2:AvatarPartStatusList = null) : void
      {
         var _loc4_:SceneCharacter = null;
         var _loc5_:AvatarParamData = null;
         var _loc6_:Array = null;
         var _loc3_:Array = waitingLoadAvatars[param1];
         if(param2 != null)
         {
            if(_loc3_ != null && _loc3_.length > 0)
            {
               for each(_loc6_ in _loc3_)
               {
                  _loc4_ = _loc6_[0];
                  _loc5_ = _loc6_[1];
                  addWaitingAddAvatar(_loc4_,_loc5_,param2);
               }
            }
         }
         else if(_loc3_ != null && _loc3_.length > 0)
         {
            for each(_loc6_ in _loc3_)
            {
               _loc4_ = _loc6_[0];
               _loc5_ = _loc6_[1];
               _loc5_.executeCallBack(_loc4_);
            }
         }
         delete waitingLoadAvatars[param1];
      }
      
      private static function addAvatarPart(param1:SceneCharacter, param2:AvatarParamData, param3:AvatarPartStatusList) : void
      {
         if(param1 == null || !param1.usable)
         {
            param2.executeCallBack(param1);
            return;
         }
         if(!param1.isOnMount)
         {
            if(param2.useType == 2)
            {
               param2.executeCallBack(param1);
               return;
            }
            if(param2.type == AvatarPartType.BODY)
            {
               if(param2.id == AvatarPartID.BLANK)
               {
                  if(param1.hasTypeAvatarParts(AvatarPartType.BODY))
                  {
                     param2.executeCallBack(param1);
                     return;
                  }
               }
               else
               {
                  param1.removeAvatarPartByID(AvatarPartID.BLANK,false);
               }
            }
         }
         else
         {
            if(param2.useType == 1)
            {
               param2.executeCallBack(param1);
               return;
            }
            if(param2.type == AvatarPartType.BODY)
            {
               if(param2.id == AvatarPartID.BLANK)
               {
                  if(param1.hasTypeAvatarParts(AvatarPartType.BODY))
                  {
                     param2.executeCallBack(param1);
                     return;
                  }
               }
               else
               {
                  param1.removeAvatarPartByID(AvatarPartID.BLANK,false);
               }
            }
         }
         var _loc4_:AvatarPart = AvatarPart.createAvatarPart(param2.clone(),param3);
         var _loc5_:AvatarPlayCondition = param1.avatar.playCondition;
         if(_loc5_ != null)
         {
            _loc5_ = _loc5_.clone();
         }
         param1.addAvatarPart(_loc4_,param2.clearSameType);
         if(param1.usable)
         {
            _loc4_.playTo(param1.avatar.status,param1.avatar.logicAngle,param2.rotation,_loc5_);
         }
      }
      
      public static function checkUninstall() : void
      {
         var _loc2_:String = null;
         if(++count < 1000)
         {
            return;
         }
         count %= 1000;
         var _loc1_:int = SceneRender.nowTime;
         for(_loc2_ in waitingRemoveAvatarImgs)
         {
            if(_loc1_ - waitingRemoveAvatarImgs[_loc2_] > UNINSTALL_DELAY_TIME)
            {
               doUninstallAvatarImg(_loc2_);
               waitingRemoveAvatarImgs[_loc2_] = null;
               delete waitingRemoveAvatarImgs[_loc2_];
            }
         }
      }
      
      public static function uninstallAvatarImg(param1:String) : void
      {
         var _loc2_:AvatarImgData = null;
         if(avatarImgCache.has(param1))
         {
            _loc2_ = avatarImgCache.get(param1) as AvatarImgData;
            --_loc2_.useNum;
            if(_loc2_.useNum <= 0)
            {
               if(!waitingRemoveAvatarImgs.hasOwnProperty(param1))
               {
                  waitingRemoveAvatarImgs[param1] = SceneRender.nowTime;
               }
            }
         }
      }
      
      private static function doUninstallAvatarImg(param1:String) : void
      {
         var _loc2_:AvatarImgData = null;
         if(avatarImgCache.has(param1))
         {
            _loc2_ = avatarImgCache.get(param1) as AvatarImgData;
            if(_loc2_.useNum <= 0)
            {
               _loc2_.dispose();
               avatarImgCache.remove(param1);
            }
         }
      }
      
      public static function installAvatarImg(param1:AvatarPartStatus, param2:String, param3:Boolean) : AvatarImgData
      {
         var _loc4_:AvatarImgData = null;
         if(param1 == null)
         {
            return null;
         }
         if(!avatarImgCache.has(param2))
         {
            _loc4_ = new AvatarImgData(param1,param2,param3);
            avatarImgCache.push(_loc4_,param2);
         }
         else
         {
            _loc4_ = avatarImgCache.get(param2) as AvatarImgData;
            _loc4_.useNum += 1;
         }
         if(waitingRemoveAvatarImgs.hasOwnProperty(param2))
         {
            waitingRemoveAvatarImgs[param2] = null;
            delete waitingRemoveAvatarImgs[param2];
         }
         return _loc4_;
      }
      
      public static function setSolids(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:String = param1 + "_" + param2;
         if(mapTiles.hasOwnProperty(_loc4_))
         {
            mapTiles[_loc4_].isSolid = param3;
         }
      }
   }
}

