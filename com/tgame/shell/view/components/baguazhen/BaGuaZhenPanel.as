package com.tgame.shell.view.components.baguazhen
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import game.display.Button;
   import game.display.Label;
   import game.display.SimpleButton;
   import game.skin.BaGuaTuXiTongYNSkin;
   import game.utils.SkinTools;
   
   public class BaGuaZhenPanel extends BasePanel
   {
      
      public static const BAGUAZHEN_JIHUO_CLICK:String = "BAGUAZHEN_JIHUO_CLICK";
      
      public static const BAGUAZHEN_CHOOSE_CLICK:String = "BAGUAZHEN_CHOOSE_CLICK";
      
      private var btnClose:SimpleButton;
      
      private var btnIndex1:SimpleButton;
      
      private var btnIndex2:SimpleButton;
      
      private var btnIndex3:SimpleButton;
      
      private var btnIndex4:SimpleButton;
      
      private var btnIndex5:SimpleButton;
      
      private var btnIndex6:SimpleButton;
      
      private var btnIndex7:SimpleButton;
      
      private var btnIndex8:SimpleButton;
      
      private var btnJiHuo:Button;
      
      private var txtName:Label;
      
      private var txtXiaoGuo:Label;
      
      private var txtTiaoJian:Label;
      
      private var txtGong:Label;
      
      private var txtFang:Label;
      
      private var txtXue:Label;
      
      private var spr1:Sprite;
      
      private var spr2:Sprite;
      
      private var spr3:Sprite;
      
      private var spr4:Sprite;
      
      private var spr5:Sprite;
      
      private var spr6:Sprite;
      
      private var spr7:Sprite;
      
      private var spr8:Sprite;
      
      private var spr1_1:Sprite;
      
      private var spr1_2:Sprite;
      
      private var spr1_3:Sprite;
      
      private var spr1_4:Sprite;
      
      private var spr1_5:Sprite;
      
      private var spr2_1:Sprite;
      
      private var spr2_2:Sprite;
      
      private var spr2_3:Sprite;
      
      private var spr2_4:Sprite;
      
      private var spr2_5:Sprite;
      
      private var currIndex:int = 1;
      
      private var currArr:Array;
      
      public function BaGuaZhenPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(BaGuaTuXiTongYNSkin.skin,"baguazhen");
         this.initUI();
      }
      
      private function initUI() : void
      {
         var obj1:Object = null;
         var obj2:Object = null;
         var obj:Object = null;
         var i:int = 0;
         i = 0;
         while(i < 5)
         {
            this["spr1_" + (i + 1)] = new Sprite();
            this["spr1_" + (i + 1)].mouseEnabled = false;
            this["spr1_" + (i + 1)].mouseChildren = false;
            addChild(this["spr1_" + (i + 1)]);
            obj1 = new Object();
            obj1.id = "spr1_" + (i + 1);
            obj1.x = 10;
            obj1.y = 37;
            LoadSwf.AndReturnMC2(GameConfig.fileBaseFolder + "res/ui/baguazhen/wuxing1/" + (i + 1) + ".swf",function(param1:MovieClip, param2:Object):*
            {
               var _loc3_:Sprite = null;
               if(param1)
               {
                  _loc3_ = new Sprite();
                  _loc3_.addChild(param1);
                  _loc3_.x = param2.x;
                  _loc3_.y = param2.y;
                  _loc3_.name = String(param2.id);
                  switch(param2.id)
                  {
                     case "spr1_1":
                        spr1_1.addChild(_loc3_);
                        break;
                     case "spr1_2":
                        spr1_2.addChild(_loc3_);
                        break;
                     case "spr1_3":
                        spr1_3.addChild(_loc3_);
                        break;
                     case "spr1_4":
                        spr1_4.addChild(_loc3_);
                        break;
                     case "spr1_5":
                        spr1_5.addChild(_loc3_);
                  }
               }
            },obj1);
            this["spr2_" + (i + 1)] = new Sprite();
            this["spr2_" + (i + 1)].mouseEnabled = false;
            this["spr2_" + (i + 1)].mouseChildren = false;
            addChild(this["spr2_" + (i + 1)]);
            obj2 = new Object();
            obj2.id = "spr2_" + (i + 1);
            obj2.x = 510;
            obj2.y = 88;
            LoadSwf.AndReturnMC2(GameConfig.fileBaseFolder + "res/ui/baguazhen/wuxing2/" + (i + 1) + ".swf",function(param1:MovieClip, param2:Object):*
            {
               var _loc3_:Sprite = null;
               if(param1)
               {
                  _loc3_ = new Sprite();
                  _loc3_.addChild(param1);
                  _loc3_.x = param2.x;
                  _loc3_.y = param2.y;
                  _loc3_.name = String(param2.id);
                  switch(param2.id)
                  {
                     case "spr2_1":
                        spr2_1.addChild(_loc3_);
                        break;
                     case "spr2_2":
                        spr2_2.addChild(_loc3_);
                        break;
                     case "spr2_3":
                        spr2_3.addChild(_loc3_);
                        break;
                     case "spr2_4":
                        spr2_4.addChild(_loc3_);
                        break;
                     case "spr2_5":
                        spr2_5.addChild(_loc3_);
                  }
               }
            },obj2);
            i++;
         }
         i = 0;
         while(i < 8)
         {
            this["spr" + (i + 1)] = new Sprite();
            this["spr" + (i + 1)].mouseEnabled = false;
            this["spr" + (i + 1)].mouseChildren = false;
            addChild(this["spr" + (i + 1)]);
            obj = new Object();
            obj.id = i + 1;
            obj.x = 10;
            obj.y = 37;
            LoadSwf.AndReturnMC2(GameConfig.fileBaseFolder + "res/ui/baguazhen/mc/" + int(i + 1) + ".swf",function(param1:MovieClip, param2:Object):*
            {
               var _loc3_:Sprite = null;
               if(param1)
               {
                  _loc3_ = new Sprite();
                  _loc3_.addChild(param1);
                  _loc3_.x = param2.x;
                  _loc3_.y = param2.y;
                  _loc3_.name = String(param2.id);
                  switch(param2.id)
                  {
                     case 1:
                        spr1.addChild(_loc3_);
                        break;
                     case 2:
                        spr2.addChild(_loc3_);
                        break;
                     case 3:
                        spr3.addChild(_loc3_);
                        break;
                     case 4:
                        spr4.addChild(_loc3_);
                        break;
                     case 5:
                        spr5.addChild(_loc3_);
                        break;
                     case 6:
                        spr6.addChild(_loc3_);
                        break;
                     case 7:
                        spr7.addChild(_loc3_);
                        break;
                     case 8:
                        spr8.addChild(_loc3_);
                  }
               }
            },obj);
            i++;
         }
      }
      
      override protected function createVariableReference() : void
      {
         this.btnClose = getChildByName("guanbi") as SimpleButton;
         this.btnClose.addEventListener(MouseEvent.CLICK,this.onCloseHandler);
         this.btnIndex1 = getChildByName("anniuqian") as SimpleButton;
         this.btnIndex1.name = 1 + "";
         this.btnIndex1.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnIndex2 = getChildByName("anniuzhen") as SimpleButton;
         this.btnIndex2.name = 2 + "";
         this.btnIndex2.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnIndex3 = getChildByName("anniukan") as SimpleButton;
         this.btnIndex3.name = 3 + "";
         this.btnIndex3.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnIndex4 = getChildByName("anniugen") as SimpleButton;
         this.btnIndex4.name = 4 + "";
         this.btnIndex4.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnIndex5 = getChildByName("anniukun") as SimpleButton;
         this.btnIndex5.name = 5 + "";
         this.btnIndex5.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnIndex6 = getChildByName("anniuxun") as SimpleButton;
         this.btnIndex6.name = 6 + "";
         this.btnIndex6.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnIndex7 = getChildByName("anniuli") as SimpleButton;
         this.btnIndex7.name = 7 + "";
         this.btnIndex7.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnIndex8 = getChildByName("anniudui") as SimpleButton;
         this.btnIndex8.name = 8 + "";
         this.btnIndex8.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.txtName = getChildByName("mingcheng") as Label;
         this.txtXiaoGuo = getChildByName("miaoshu") as Label;
         this.txtXiaoGuo.wordWrap = true;
         this.txtTiaoJian = getChildByName("shengjitiaoji1") as Label;
         this.txtTiaoJian.wordWrap = true;
         this.txtGong = getChildByName("shuzhiwenben1") as Label;
         this.txtFang = getChildByName("shuzhiwenben2") as Label;
         this.txtXue = getChildByName("shuzhiwenben3") as Label;
         this.btnJiHuo = getChildByName("jihuoanniu") as Button;
         this.btnJiHuo.addEventListener(MouseEvent.CLICK,this.onClickJiHuoHandler);
      }
      
      private function onClickJiHuoHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(BaGuaZhenPanel.BAGUAZHEN_JIHUO_CLICK,"",this.currIndex));
      }
      
      public function setBaGuaZhenData(param1:Object) : void
      {
         this.currArr = param1.arr;
         var _loc2_:int = 0;
         while(_loc2_ < this.currArr.length)
         {
            this["spr" + (_loc2_ + 1)].visible = this.currArr[_loc2_].isJiHuo == 1 ? true : false;
            _loc2_++;
         }
         this.currIndex = param1.currIndex;
         var _loc3_:Object = this.currArr[this.currIndex - 1];
         this.setBaGuaZhenShow(_loc3_);
      }
      
      public function setBaGuaZhenShow(param1:Object) : void
      {
         this.txtName.text = param1.name + "";
         this.txtXiaoGuo.text = param1.xiaoguo + "";
         this.txtTiaoJian.text = param1.tiaojian + "";
         this.txtGong.text = param1.shuxing1 + "";
         this.txtFang.text = param1.shuxing2 + "";
         this.txtXue.text = param1.shuxing3 + "";
         this.btnJiHuo.visible = param1.isJiHuo == 1 ? false : true;
         var _loc2_:int = this.getWuXingIndexByIndex(this.currIndex);
         var _loc3_:int = 0;
         while(_loc3_ < 5)
         {
            if(_loc3_ + 1 == _loc2_)
            {
               this["spr1_" + (_loc3_ + 1)].visible = true;
               this["spr2_" + (_loc3_ + 1)].visible = true;
            }
            else
            {
               this["spr1_" + (_loc3_ + 1)].visible = false;
               this["spr2_" + (_loc3_ + 1)].visible = false;
            }
            _loc3_++;
         }
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(BaGuaZhenPanel.BAGUAZHEN_CHOOSE_CLICK,"",int(param1.currentTarget.name)));
      }
      
      private function getWuXingIndexByIndex(param1:int) : int
      {
         switch(param1)
         {
            case 1:
            case 8:
               return 1;
            case 2:
            case 6:
               return 2;
            case 3:
               return 3;
            case 7:
               return 4;
            case 4:
            case 5:
               return 5;
            default:
               return 0;
         }
      }
      
      private function onCloseHandler(param1:MouseEvent) : void
      {
         if(Boolean(this.parent) && parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

