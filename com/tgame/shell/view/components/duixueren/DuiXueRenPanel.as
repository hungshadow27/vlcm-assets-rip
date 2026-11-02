package com.tgame.shell.view.components.duixueren
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class DuiXueRenPanel extends FPanel
   {
      
      public static const DUIXUEREN_CLICK:String = "DUIXUEREN_CLICK";
      
      public static const DUIXUEREN_DUIHUAN_CLICK:String = "DUIXUEREN_DUIHUAN_CLICK";
      
      public static const QUANMINGZAIXIAN_CHOUJIANG_CLICK:String = "QUANMINGZAIXIAN_CHOUJIANG_CLICK";
      
      public static const QUANMINGZAIXIAN_LINGQU_CLICK:String = "QUANMINGZAIXIAN_LINGQU_CLICK";
      
      public static const QUANMINGCHOUJIANG:String = "QUANMINGCHOUJIANG";
      
      public static const QUANMINGCHOUJIANG_KAISHI:String = "QUANMINGCHOUJIANG_KAISHI";
      
      public static const QUANMINGCHOUJIANG_LIANGQU:String = "QUANMINGCHOUJIANG_LIANGQU";
      
      public static const JIAONANGRANK_LINGQU_CLICK:String = "JIAONANGRANK_LINGQU_CLICK";
      
      public static const JIAONANGRANK_FANYE_CLICK:String = "JIAONANGRANK_FANYE_CLICK";
      
      private var rankPanel:DuiXueRenRankPanel;
      
      private var btnDuiXueRen:NewSkinButton;
      
      private var btnQuanMinZaiXian:NewSkinButton;
      
      private var btnQuanMinChouJiang:NewSkinButton;
      
      private var duiXueRen:DuiXueRen_DuiXueRenView;
      
      private var quanMinZaiXian:DuiXueRen_QuanMinZaiXianView;
      
      private var quanMinChouJiang:DuiXueRen_QuanMinChouJiangView;
      
      private var currDisplay:Sprite;
      
      public function DuiXueRenPanel()
      {
         super();
         this.titleText = LanResManager.getLanCommonTextWords("十二月活动");
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 635;
         height = 578;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.rankPanel = new DuiXueRenRankPanel();
         this.rankPanel.x = 635;
         this.rankPanel.y = -30;
         this.rankPanel.$parent = this;
         this.btnDuiXueRen = new NewSkinButton();
         this.btnDuiXueRen.skin = "duixueren_dxr_Button";
         this.btnDuiXueRen.x = -90;
         this.btnDuiXueRen.y = 20;
         this.btnDuiXueRen.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnQuanMinZaiXian = new NewSkinButton();
         this.btnQuanMinZaiXian.skin = "duixueren_qmzx_Button";
         this.btnQuanMinZaiXian.x = -90;
         this.btnQuanMinZaiXian.y = 60;
         this.btnQuanMinZaiXian.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnQuanMinChouJiang = new NewSkinButton();
         this.btnQuanMinChouJiang.skin = "qmfi_qmcj_Button";
         this.btnQuanMinChouJiang.x = -90;
         this.btnQuanMinChouJiang.y = 100;
         this.btnQuanMinChouJiang.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.duiXueRen = new DuiXueRen_DuiXueRenView();
         this.duiXueRen.$parent = this;
         this.duiXueRen.visible = false;
         addChild(this.duiXueRen);
         this.quanMinZaiXian = new DuiXueRen_QuanMinZaiXianView();
         this.quanMinZaiXian.$parent = this;
         this.quanMinZaiXian.visible = false;
         addChild(this.quanMinZaiXian);
         this.quanMinChouJiang = new DuiXueRen_QuanMinChouJiangView();
         this.quanMinChouJiang.$parent = this;
         this.quanMinChouJiang.visible = false;
         addChild(this.quanMinChouJiang);
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.btnDuiXueRen:
               dispatchEvent(new BaseEvent(DuiXueRenPanel.DUIXUEREN_CLICK,"",1));
               break;
            case this.btnQuanMinZaiXian:
               dispatchEvent(new BaseEvent(DuiXueRenPanel.DUIXUEREN_CLICK,"",2));
               break;
            case this.btnQuanMinChouJiang:
               dispatchEvent(new BaseEvent(DuiXueRenPanel.DUIXUEREN_CLICK,"",3));
         }
      }
      
      public function setCurrIndexView(param1:int) : void
      {
         if(this.currDisplay)
         {
            this.currDisplay.visible = false;
         }
         switch(param1)
         {
            case 1:
               this.currDisplay = this.duiXueRen;
               break;
            case 2:
               this.currDisplay = this.quanMinZaiXian;
               break;
            case 3:
               this.currDisplay = this.quanMinChouJiang;
         }
         this.currDisplay.visible = true;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setDuiXueRenData(param1:int = 0, param2:Array = null) : void
      {
         this.duiXueRen.setDuiXueRenData(param1,param2);
      }
      
      public function setQuanMingZaiXianData(param1:int, param2:Array) : void
      {
         this.quanMinZaiXian.setQuanMingZaiXianData(param1,param2);
      }
      
      public function setQuanMingZaiXianResult(param1:int, param2:int) : void
      {
         this.quanMinZaiXian.setQuanMingZaiXianResult(param1,param2);
      }
      
      public function setQuanMinChouJiangData(param1:int = 0, param2:Object = null, param3:Array = null, param4:int = 0, param5:int = 0) : void
      {
         this.quanMinChouJiang.setQuanMinChouJiangData(param1,param2,param3,param4,param5);
      }
      
      public function setTurnData(param1:Object, param2:int) : void
      {
         this.quanMinChouJiang.setTurnData(param1,param2);
      }
      
      public function setJiaoNangDaLuanDouRankData(param1:Array, param2:Object) : void
      {
         this.rankPanel.setJiaoNangDaLuanDouRankData(param1,param2);
      }
   }
}

