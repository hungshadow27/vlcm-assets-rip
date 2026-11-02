package com.tgame.common.res.npc
{
   public class NpcResManager
   {
      
      private static var npcResContainer:Object = new Object();
      
      private static var npcTransContainer:Object = new Object();
      
      public function NpcResManager()
      {
         super();
      }
      
      public static function parseNpcRes(param1:String) : void
      {
         var npcRes:NpcRes = null;
         var xml:XML = null;
         var useFindXY:Boolean = false;
         var obj:String = param1;
         var npcResXML:XML = XML(obj);
         if(!npcResXML)
         {
            return;
         }
         for each(xml in npcResXML.npcs.npc)
         {
            npcRes = new NpcRes();
            npcRes.id_kind = int(Number(xml.@id));
            npcRes.id_m = int(Number(xml.@npcmodel));
            npcRes.name = String(xml.name).split("_")[0];
            npcRes.nickname = xml.nickname;
            npcRes.sceneid = int(Number(xml.@sceneid));
            npcRes.x = int(Number(xml.@x));
            npcRes.y = int(Number(xml.@y));
            useFindXY = int(Number(xml.@findX)) != 0 || int(Number(xml.@findY)) != 0;
            npcRes.findX = useFindXY ? int(Number(xml.@findX)) : npcRes.x;
            npcRes.findY = useFindXY ? int(Number(xml.@findY)) : npcRes.y;
            npcRes.direction = int(Number(xml.@direction));
            npcRes.can_redirect = int(Number(xml.@can_redirect));
            npcRes.simpleTalk = String(xml.simpleTalk).split("#");
            npcRes.randomTalk = String(xml.@randomTalk).split("#");
            npcRes.npctype = int(Number(xml.@npctype));
            npcRes.shop_type = int(Number(xml.@shopType));
            npcRes.id_ico = int(Number(xml.@npc_icon));
            npcRes.id_ico_big = int(Number(xml.@npc_big_icon));
            npcRes.functions = xml.@functions == undefined || String(xml.@functions) == "" ? [] : String(xml.@functions).split(",").map(function(param1:*, param2:int, param3:Array):int
            {
               return int(Number(param1));
            });
            npcRes.function_task = xml.@function_task == undefined || String(xml.@function_task) == "" ? [] : String(xml.@function_task).split(",").map(function(param1:*, param2:int, param3:Array):int
            {
               return int(Number(param1));
            });
            npcRes.function_shop = xml.@function_shop == undefined || String(xml.@function_shop) == "" ? [] : String(xml.@function_shop).split(",").map(function(param1:*, param2:int, param3:Array):int
            {
               return int(Number(param1));
            });
            npcRes.function_transfer = xml.@function_transfer == undefined || String(xml.@function_transfer) == "" ? [] : String(xml.@function_transfer).split(",").map(function(param1:*, param2:int, param3:Array):int
            {
               return int(Number(param1));
            });
            npcRes.function_activity = xml.@function_activity == undefined || String(xml.@function_activity) == "" ? [] : String(xml.@function_activity).split(",").map(function(param1:*, param2:int, param3:Array):int
            {
               return int(Number(param1));
            });
            npcResContainer[npcRes.id_kind] = npcRes;
         }
      }
      
      public static function parseTransRes(param1:String) : void
      {
         var _loc3_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc3_ in _loc2_.trans.t)
         {
            npcTransContainer[int(Number(_loc3_.@id))] = _loc3_;
         }
      }
      
      public static function getNpcRes(param1:int) : NpcRes
      {
         return npcResContainer[param1];
      }
      
      public static function getNpcTransXML(param1:int) : XML
      {
         return npcTransContainer[param1];
      }
      
      public static function getNpcIDandTaskIDArrBySceneID(param1:int = -1) : Array
      {
         var _loc3_:NpcRes = null;
         var _loc4_:Array = null;
         var _loc2_:Array = [];
         for each(_loc3_ in npcResContainer)
         {
            if(param1 == -1 || _loc3_.sceneid == param1)
            {
               _loc4_ = getTaskIDListByNpcID(_loc3_.id_kind);
               if((Boolean(_loc4_)) && _loc4_.length > 0)
               {
                  _loc2_[_loc2_.length] = [_loc3_.id_kind,_loc4_];
               }
            }
         }
         return _loc2_;
      }
      
      public static function getNpcArrBySceneID(param1:int = -1) : Array
      {
         var _loc3_:NpcRes = null;
         var _loc4_:Array = null;
         var _loc2_:Array = [];
         for each(_loc3_ in npcResContainer)
         {
            if(param1 == -1 || _loc3_.sceneid == param1)
            {
               _loc2_[_loc2_.length] = _loc3_;
            }
         }
         return _loc2_;
      }
      
      public static function getNpcResListBySceneID(param1:int) : Array
      {
         var _loc3_:NpcRes = null;
         var _loc2_:Array = [];
         for each(_loc3_ in npcResContainer)
         {
            if(_loc3_.sceneid == param1)
            {
               _loc2_[_loc2_.length] = _loc3_;
            }
         }
         return _loc2_;
      }
      
      public static function getFunctionIDListByNpcID(param1:int) : Array
      {
         var _loc2_:NpcRes = getNpcRes(param1);
         if(_loc2_ != null)
         {
            return _loc2_.functions;
         }
         return [];
      }
      
      public static function getTaskIDListByNpcID(param1:int) : Array
      {
         var _loc2_:NpcRes = getNpcRes(param1);
         if(_loc2_ != null)
         {
            return _loc2_.function_task;
         }
         return [];
      }
      
      public static function getGoodsListByNpcID(param1:int) : Array
      {
         throw new Error("原来这里返回的是GameItem的数组,现在改为ID的数组了");
      }
      
      public static function getTransListByNpcID(param1:int) : Array
      {
         throw new Error("原来这里返回的是[[id:int, name:String, sceneId:int, x:int, y:int]...],现在改为ID的数组了");
      }
      
      public static function getActivityListByNpcID(param1:int) : Array
      {
         throw new Error("现在改为ID的数组了");
      }
   }
}

