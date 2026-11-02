package com.tgame.shell.view.components.friend
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.shell.view.components.FriendPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class NPCAttributePanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var npcName:FLabel;
      
      private var level:FLabel;
      
      private var attribute:FTextArea;
      
      private var avatar:Bitmap;
      
      private var container:Sprite;
      
      private var synopsis:FTextArea;
      
      private var scroll:FVScorllBar;
      
      private var state:FLabel;
      
      private var recoverBtn:SecondButton;
      
      private var battleBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var id:int;
      
      public function NPCAttributePanel()
      {
         var img:Bitmap;
         var lb:FLabel;
         var ft:FTextArea;
         super();
         skin = "panel_btn";
         dragAble = true;
         this.dragRestrict = false;
         showCloseButton = true;
         width = 337;
         height = 465;
         titleText = LanResManager.getLanCommonTextWords("资料查看");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.friend.npc.info.look.ui");
         addChild(img);
         img.x = 10;
         img.y = 2;
         lb = new FLabel();
         with(lb)
         {
            x = 23;
            y = 6;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"名　字：");
         }
         addChild(lb);
         this.npcName = new FLabel();
         with(this.npcName)
         {
            x = 74;
            y = 6;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("名字一共六字");
         }
         addChild(this.npcName);
         lb = new FLabel();
         with(lb)
         {
            x = 23;
            y = 22;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords("等　级：");
         }
         addChild(lb);
         this.level = new FLabel();
         with(this.level)
         {
            x = 74;
            y = 22;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "100";
         }
         addChild(this.level);
         ft = new FTextArea();
         with(ft)
         {
            x = 192;
            y = 8;
            width = 76;
            height = 160;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,0);
         }
         addChild(ft);
         this.attribute = new FTextArea();
         with(this.attribute)
         {
            x = 270;
            y = 8;
            width = 76;
            height = 160;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'4\'>9999<br>9999<br>9999<br>9999<br>9999<br>9999<br>9999<br></textformat>";
         }
         addChild(this.attribute);
         this.container = new Sprite();
         addChild(this.container);
         this.container.x = 160;
         this.container.y = 165;
         this.synopsis = new FTextArea();
         with(this.synopsis)
         {
            x = 16;
            y = 269;
            width = 289;
            height = 117;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.synopsis);
         this.scroll = new FVScorllBar(this.synopsis,117);
         addChild(this.scroll);
         this.scroll.x = 305;
         this.scroll.y = 269;
         lb = new FLabel();
         with(lb)
         {
            x = 16;
            y = 398;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"状态：");
         }
         addChild(lb);
         this.state = new FLabel();
         with(this.state)
         {
            x = 56;
            y = 398;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanTextWords(this,"休息");
         }
         addChild(this.state);
         this.recoverBtn = new SecondButton();
         this.recoverBtn.label = LanResManager.getLanTextWords(this,"恢复生命");
         addChild(this.recoverBtn);
         this.recoverBtn.x = 100;
         this.recoverBtn.y = 400;
         this.recoverBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.battleBtn = new SecondButton();
         this.battleBtn.label = LanResManager.getLanTextWords(this,"出战");
         addChild(this.battleBtn);
         this.battleBtn.x = 193;
         this.battleBtn.y = 400;
         this.battleBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - this.cancelBtn.width - 16;
         this.cancelBtn.y = 400;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.recoverBtn:
               this.$parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_NPC_RECOVER_HP_BTN_CLICK,"",this.id));
               break;
            case this.battleBtn:
               this.$parent.dispatchEvent(new BaseEvent(FriendPanel.UI_FRIEND_NPC_BATTLE_BTN_CLICK,"",this.id));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setNPC(param1:int, param2:BitmapData, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Array, param13:String, param14:String) : void
      {
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:ItemFace = null;
         this.id = param1;
         this.npcName.text = param3;
         this.level.text = param4.toString();
         this.attribute.htmlText = "<textformat leading=\'4\'>" + param5 + "<br>" + param6 + "<br>" + param7 + "<br>" + param8 + "<br>" + param9 + "<br>" + param10 + "<br>" + param11 + "<br></textformat>";
         this.synopsis.text = param13;
         this.state.text = param14;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         var _loc18_:int = int(param12.length);
         _loc15_ = 0;
         loop1:
         while(_loc15_ < 2)
         {
            _loc16_ = 0;
            while(_loc16_ < 4)
            {
               if(_loc15_ * 4 + _loc16_ == _loc18_)
               {
                  break loop1;
               }
               _loc17_ = new ItemFace(param12[_loc15_ * 4 + _loc16_] as BaseItem);
               this.container.addChild(_loc17_);
               _loc17_.x = _loc16_ * 40;
               _loc17_.y = _loc15_ * 40;
               _loc16_++;
            }
            _loc15_++;
         }
      }
      
      public function setAttribute(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         if(this.id != param1)
         {
            return;
         }
         this.attribute.htmlText = "<textformat leading=\'4\'>" + param2 + "<br>" + param3 + "<br>" + param4 + "<br>" + param5 + "<br>" + param6 + "<br>" + param7 + "<br>" + param8 + "<br></textformat>";
      }
      
      public function setState(param1:int, param2:String) : void
      {
         if(this.id != param1)
         {
            return;
         }
         this.state.text = param2;
      }
   }
}

