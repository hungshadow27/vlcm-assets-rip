package com.tgame.moudels.biwuzhaoqin.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.biwuzhaoqin.BiWuZhaoQin_ApplicationFacade;
   import com.tgame.moudels.biwuzhaoqin.model.BiWuZhaoQin_MsgSenderProxy;
   import com.tgame.shell.view.components.BiWuZhaoQinPanel;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BiWuZhaoQin_Mediator extends Mediator
   {
      
      public static const NAME:String = "BiWuZhaoQin_Mediator";
      
      private var _timeTextField:TextField;
      
      private var biWuZhaoQinPanel:BiWuZhaoQinPanel;
      
      private var _senderProxy:BiWuZhaoQin_MsgSenderProxy;
      
      public function BiWuZhaoQin_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : BiWuZhaoQin_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(BiWuZhaoQin_MsgSenderProxy.NAME) as BiWuZhaoQin_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainCharArrtibutePlane() : BiWuZhaoQinPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.biWuZhaoQin);
         }
         return viewComponent as BiWuZhaoQinPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [BiWuZhaoQin_ApplicationFacade.BI_WU_ZHAO_QIN,BiWuZhaoQin_ApplicationFacade.ENTER_SCENE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case BiWuZhaoQin_ApplicationFacade.BI_WU_ZHAO_QIN:
               this.senderProxy.send_61501();
               break;
            case BiWuZhaoQin_ApplicationFacade.ENTER_SCENE:
               if(GameConfig.wantEnterMapRes.isFuben != 14)
               {
                  this.clear_time();
                  if(GameInstance.uiInstance._popMapPanel != null)
                  {
                     PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_XIUQIU,[OtherConst.XIUQIU_REMOVE]);
                  }
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var _loc2_:String = param1.type;
      }
      
      public function showBiWuZhaoQinPanel(param1:String, param2:int) : void
      {
         var name:String = param1;
         var id:int = param2;
         if(this.biWuZhaoQinPanel == null)
         {
            this.biWuZhaoQinPanel = new BiWuZhaoQinPanel();
            this.biWuZhaoQinPanel.addEventListener(BiWuZhaoQinPanel.JINRUCHANGDI_CLICK,function(param1:Event):void
            {
               senderProxy.send_61503();
            });
         }
         this.biWuZhaoQinPanel.setGirlName(name);
         this.biWuZhaoQinPanel.setGirlPicture(id);
         this.biWuZhaoQinPanel.x = (GameConfig.sceneWidth - this.biWuZhaoQinPanel.width) / 2;
         this.biWuZhaoQinPanel.y = (GameConfig.sceneHeight - this.biWuZhaoQinPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.biWuZhaoQinPanel);
      }
      
      public function receive_time(param1:Object = null) : void
      {
         if(this._timeTextField == null)
         {
            this._timeTextField = new TextField();
            this._timeTextField.mouseEnabled = false;
            this._timeTextField.x = 50;
            this._timeTextField.y = 122;
            this._timeTextField.autoSize = TextFieldAutoSize.LEFT;
            this._timeTextField.defaultTextFormat = new TextFormat(LanResManager.getLanCommonTextWords("宋体"),18,16777215);
            GameInstance.uiInstance.letterContainer.addChild(this._timeTextField);
         }
         var _loc2_:String = "";
         _loc2_ += "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("绣球位置：") + "</font>" + LanResManager.getLanCommonTextWords("比武招亲") + "(" + param1.xiuqiuX + "," + param1.xiuqiuY + ")";
         _loc2_ += "\n<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("绣球当前持有者：") + "</font>" + param1.chiyouzhe;
         _loc2_ += "\n<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您在比武招亲地图停留时间：") + "</font>" + param1.tingliuShijian + LanResManager.getLanCommonTextWords("分钟");
         _loc2_ += "\n<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("距离比武招亲结束还剩：") + "</font>" + param1.shengyuJieshuShijian + LanResManager.getLanCommonTextWords("分钟");
         _loc2_ += "\n<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("比赛结束时持有绣球的玩家将获胜") + "</font>";
         this._timeTextField.htmlText = _loc2_;
         PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_XIUQIU,[OtherConst.XIUQIU_ADD,new Point(param1.xiuqiuX * 25,param1.xiuqiuY * 25)]);
      }
      
      private function clear_time() : void
      {
         if(this._timeTextField != null)
         {
            if(this._timeTextField.parent)
            {
               this._timeTextField.parent.removeChild(this._timeTextField);
            }
            this._timeTextField = null;
         }
      }
   }
}

