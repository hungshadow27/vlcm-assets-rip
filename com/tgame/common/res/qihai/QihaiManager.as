package com.tgame.common.res.qihai
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class QihaiManager
   {
      
      public static var qihaiResContainer:Object = new Object();
      
      public function QihaiManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:XML = null;
         var _loc4_:QihaiRes = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc3_ in _loc2_.qihais.qihai)
         {
            _loc4_ = new QihaiRes();
            _loc4_.id = _loc3_.@id;
            _loc4_.name = _loc3_.name;
            _loc4_.add_attack = _loc3_.@add_attack;
            _loc4_.add_defence = _loc3_.@add_defence;
            _loc4_.add_maxhp = _loc3_.@add_maxhp;
            _loc4_.add_crt = _loc3_.@add_crt;
            _loc4_.add_dodge = _loc3_.@add_dodge;
            _loc4_.up_zhenqi = _loc3_.@up_zhenqi;
            _loc4_.up_copper = _loc3_.@up_copper;
            _loc4_.up_probability_show = _loc3_.@up_probability_show;
            qihaiResContainer[_loc4_.id] = _loc4_;
         }
      }
      
      public static function getQihaiRes(param1:int) : QihaiRes
      {
         var _loc4_:QihaiRes = null;
         var _loc2_:QihaiRes = qihaiResContainer[param1];
         var _loc3_:int = _loc2_.id;
         for each(_loc4_ in qihaiResContainer)
         {
            if(_loc3_ == _loc4_.id)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public static function getQihaiJiachengRes(param1:int) : String
      {
         var _loc5_:QihaiRes = null;
         var _loc2_:String = "";
         var _loc3_:QihaiRes = qihaiResContainer[param1];
         var _loc4_:int = _loc3_.id;
         for each(_loc5_ in qihaiResContainer)
         {
            if(_loc4_ == _loc5_.id)
            {
               if(_loc5_.add_attack > 0)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("攻击:") + _loc5_.add_attack + " ";
               }
               if(_loc5_.add_defence > 0)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("防御:") + _loc5_.add_defence + " ";
               }
               if(_loc5_.add_maxhp > 0)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("生命上限:") + _loc5_.add_maxhp + " ";
               }
               if(_loc5_.add_crt > 0)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("暴击:") + _loc5_.add_crt + " ";
               }
               if(_loc5_.add_dodge > 0)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("闪避:") + _loc5_.add_dodge + " ";
               }
            }
         }
         return _loc2_;
      }
   }
}

