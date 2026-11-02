package com.tgame.moudels.friend.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.vo.character.Player;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.friend.model.Friend_MsgSenderProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.shitu.getExpJiangLiPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JingYanJiangLi_Mediator extends Mediator
   {
      
      public static const NAME:String = "JingYanJiangLi_Mediator";
      
      private var menuUI:Menu;
      
      private var load:LoadBuffer;
      
      private var nowPageNum:int = 1;
      
      private var maxPageNum:int = 1;
      
      private var loaderBuff:LoadBuffer;
      
      private var char_avatar_zizeng:int = 0;
      
      private var _msgSenderProxy:Friend_MsgSenderProxy;
      
      public function JingYanJiangLi_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Friend_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Friend_MsgSenderProxy.NAME) as Friend_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get expJiangLiPanel() : getExpJiangLiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.jingYanJiangLiPanel);
         }
         return viewComponent as getExpJiangLiPanel;
      }
      
      private function get mainUI() : MainUI
      {
         return GameInstance.uiInstance.mainUI;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(getExpJiangLiPanel,function():void
         {
            expJiangLiPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            expJiangLiPanel.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            expJiangLiPanel.addEventListener(getExpJiangLiPanel.UI_EGTEXPJIANGLIPANEL_LIST_GET_PAGE,expJiangLiPanelHandel);
            expJiangLiPanel.addEventListener(getExpJiangLiPanel.UI_EGTEXPJIANGLIPANEL_LINGQU_BTN,expJiangLiPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(getExpJiangLiPanel,function():void
         {
            expJiangLiPanel.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            expJiangLiPanel.addEventListener(getExpJiangLiPanel.UI_EGTEXPJIANGLIPANEL_LIST_GET_PAGE,expJiangLiPanelHandel);
            expJiangLiPanel.addEventListener(getExpJiangLiPanel.UI_EGTEXPJIANGLIPANEL_LINGQU_BTN,expJiangLiPanelHandel);
         });
      }
      
      private function onRemoveToStage(param1:Event) : void
      {
         TCursorManager.resumFullMouse();
      }
      
      private function onAddToStage(param1:Event) : void
      {
      }
      
      private function expJiangLiPanelHandel(param1:Event) : void
      {
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:SceneCharacter = GameInstance.mainChar;
         var _loc4_:String = param1.type;
         var _loc5_:BaseEvent = param1 as BaseEvent;
         var _loc6_:int = 0;
         var _loc7_:int = _loc5_.data as int;
         switch(_loc4_)
         {
            case getExpJiangLiPanel.UI_EGTEXPJIANGLIPANEL_LIST_GET_PAGE:
               if(_loc7_ == 1)
               {
                  this.nowPageNum = 1;
               }
               if(_loc7_ == 2)
               {
                  --this.nowPageNum;
               }
               if(_loc7_ == 3)
               {
                  ++this.nowPageNum;
               }
               if(_loc7_ == 4)
               {
                  this.nowPageNum = this.maxPageNum;
               }
               if(this.nowPageNum < 1)
               {
                  this.nowPageNum = 1;
               }
               if(this.nowPageNum > this.maxPageNum)
               {
                  this.nowPageNum = this.maxPageNum;
               }
               this.msgSenderProxy.send_11009(this.nowPageNum);
               this.addLoadBuffer();
               break;
            case getExpJiangLiPanel.UI_EGTEXPJIANGLIPANEL_LINGQU_BTN:
               this.msgSenderProxy.send_11011(_loc7_);
               this.addLoadBuffer();
         }
      }
      
      public function showJingYanJiangLiPanel(param1:int, param2:int, param3:Array) : void
      {
         var _loc4_:XML = null;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         this.nowPageNum = param2;
         this.maxPageNum = param1;
         if(!Fun.isVisible(GameInstance.uiInstance._jingYanJiangLiPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_JINGYANJIANGLI_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance._friendPanel))
         {
            _loc4_ = <list></list>;
            _loc5_ = param2 == 1 ? true : false;
            _loc6_ = param2 == param1 ? true : false;
            _loc7_ = 0;
            while(_loc7_ < param3.length)
            {
               _loc4_.appendChild(<node id={param3[_loc7_].id} name={param3[_loc7_].name} level={param3[_loc7_].lv} exp={param3[_loc7_].exp} sw={param3[_loc7_].sw}/>);
               _loc7_++;
            }
            this.expJiangLiPanel.setList(_loc4_,param2,param1,_loc5_,_loc6_);
         }
      }
      
      public function refreshPageData() : void
      {
         this.msgSenderProxy.send_11009(this.nowPageNum);
         this.addLoadBuffer();
      }
      
      private function addLoadBuffer() : void
      {
         this.removeLoaderBuff();
         this.loaderBuff = LoadBuffer.show(this.expJiangLiPanel);
      }
      
      public function removeLoaderBuff() : void
      {
         if(this.loaderBuff)
         {
            this.loaderBuff.close();
         }
         this.loaderBuff = null;
      }
   }
}

