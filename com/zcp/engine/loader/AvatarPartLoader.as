package com.zcp.engine.loader
{
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.config.GlobalConfig;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.tools.SceneCache;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.avatar.AvatarPartStatusList;
   import com.zcp.manager.RslLoaderManager;
   
   public class AvatarPartLoader
   {
      
      public function AvatarPartLoader()
      {
         super();
      }
      
      public static function loadAvatarPart(param1:SceneCharacter, param2:AvatarParamData = null) : void
      {
         var loadSource:Function;
         var apd:AvatarParamData = null;
         var apsList:AvatarPartStatusList = null;
         var tryLoadCount:int = 0;
         var priority:int = 0;
         var loadSourceComplete:Function = null;
         var loadError:Function = null;
         var $sc:SceneCharacter = param1;
         var $apd:AvatarParamData = param2;
         $apd = $apd != null ? $apd.clone() : new AvatarParamData();
         if($sc != null && $sc.usable && $apd.sourcePath != null && $apd.sourcePath != "")
         {
            if($apd.clearSameType)
            {
               SceneCache.removeWaitingAvatar($sc,null,$apd.type);
            }
            if(!SceneCache.avatarXmlCache.has($apd.sourcePath))
            {
               loadSource = function():void
               {
                  var _loc1_:LoadData = new LoadData($apd.sourcePath,null,null,loadError,"","",0,GlobalConfig.decode);
                  RslLoaderManager.load([_loc1_],loadSourceComplete,priority);
               };
               loadSourceComplete = function():void
               {
                  var _loc2_:XML = null;
                  var _loc1_:Class = RslLoaderManager.getClass($apd.className);
                  if(_loc1_ != null)
                  {
                     _loc2_ = _loc1_.X_M_L as XML;
                     apsList = new AvatarPartStatusList($apd.className,_loc2_);
                     if(SceneCache.avatarXmlCache.has($apd.sourcePath))
                     {
                        SceneCache.avatarXmlCache.get($apd.sourcePath).data = apsList;
                     }
                     else
                     {
                        SceneCache.avatarXmlCache.push({"data":apsList},$apd.sourcePath);
                     }
                     SceneCache.dowithWaiting($apd.sourcePath,apsList);
                  }
                  else
                  {
                     loadError(null,null,false);
                  }
               };
               loadError = function(param1:LoadData = null, param2:* = null, param3:Boolean = true):void
               {
                  var _loc4_:Boolean = true;
                  if(param3)
                  {
                     ++tryLoadCount;
                     if(tryLoadCount < 3)
                     {
                        _loc4_ = false;
                        loadSource();
                     }
                     else
                     {
                        _loc4_ = true;
                     }
                  }
                  if(_loc4_)
                  {
                     if(SceneCache.avatarXmlCache.has($apd.sourcePath))
                     {
                        SceneCache.avatarXmlCache.remove($apd.sourcePath);
                     }
                     SceneCache.dowithWaiting($apd.sourcePath,null);
                  }
               };
               SceneCache.avatarXmlCache.push({"data":null},$apd.sourcePath);
               SceneCache.addWaitingLoadAvatar($sc,$apd,loadSource);
               tryLoadCount = 0;
               priority = SceneCharacterType.getDefaultLoadPriority($sc.type);
            }
            else
            {
               apsList = SceneCache.avatarXmlCache.get($apd.sourcePath).data;
               if(apsList == null)
               {
                  SceneCache.addWaitingLoadAvatar($sc,$apd.clone());
               }
               else
               {
                  SceneCache.addWaitingAddAvatar($sc,$apd.clone(),apsList);
               }
            }
         }
         else
         {
            $apd.executeCallBack($sc,null,true,true,true,true,true,true,0,0,0,0,0,0);
         }
      }
   }
}

