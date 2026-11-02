package com.tgame.moudels.shouji.model
{
   import com.fireice.alert.FAlert;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.info.ShoujiInfo;
   import com.tgame.common.vo.character.info.data.CharShoujiData;
   import com.tgame.moudels.shouji.view.Shouji_ShoujiPlaneMediator;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Shouji_ShoujiProxy extends Proxy
   {
      
      public static const NAME:String = "Shouji_ShoujiProxy";
      
      private var _shoujiPanelMediator:Shouji_ShoujiPlaneMediator;
      
      public function Shouji_ShoujiProxy()
      {
         super(NAME);
      }
      
      protected function get shoujiInfo() : ShoujiInfo
      {
         if(data == null)
         {
            setData(GameInstance.mainCharData.shoujiInfo);
         }
         return data as ShoujiInfo;
      }
      
      private function get shoujiPanelMediator() : Shouji_ShoujiPlaneMediator
      {
         if(this._shoujiPanelMediator == null)
         {
            this._shoujiPanelMediator = facade.retrieveMediator(Shouji_ShoujiPlaneMediator.NAME) as Shouji_ShoujiPlaneMediator;
         }
         return this._shoujiPanelMediator;
      }
      
      public function init(param1:Array) : void
      {
         this.shoujiInfo.init(param1);
         this.shoujiPanelMediator.updateUI();
      }
      
      public function updateObj(param1:Object) : void
      {
         this.shoujiInfo.updateObj(param1);
         this.shoujiPanelMediator.updateGuWanUI(param1.id);
      }
      
      public function lingquSuccess(param1:int, param2:Array) : void
      {
         this.shoujiInfo.updateSuccess(param1);
         this.shoujiPanelMediator.updateGuWanUI(param1);
         var _loc3_:CharShoujiData = this.shoujiInfo.getShouji(param1);
         var _loc4_:String = _loc3_.shoujiRes.name;
         var _loc5_:int = param2[0] + param2[1] + param2[2] + param2[3];
         var _loc6_:String = LanResManager.getLanTextWords(this,"恭喜您完成",[StaticValue.YELLOW_HTML,_loc4_,StaticValue.RED_HTML,_loc5_,StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,param2[0],StaticValue.GREEN_HTML,param2[1],StaticValue.GREEN_HTML,param2[2],StaticValue.GREEN_HTML,param2[3]]);
         FAlert.show(_loc6_);
         this.shoujiPanelMediator.updateUI();
      }
   }
}

