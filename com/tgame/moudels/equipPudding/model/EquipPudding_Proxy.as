package com.tgame.moudels.equipPudding.model
{
   import com.tgame.moudels.equipPudding.view.UI_MainCharEquipPuddingPanelMediator;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class EquipPudding_Proxy extends Proxy
   {
      
      public static const NAME:String = "EquipPudding_Proxy";
      
      private var _equipPuddingMediator:UI_MainCharEquipPuddingPanelMediator;
      
      public function EquipPudding_Proxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get equipPuddingMediator() : UI_MainCharEquipPuddingPanelMediator
      {
         if(this._equipPuddingMediator == null)
         {
            this._equipPuddingMediator = facade.retrieveMediator(UI_MainCharEquipPuddingPanelMediator.NAME) as UI_MainCharEquipPuddingPanelMediator;
         }
         return this._equipPuddingMediator;
      }
   }
}

