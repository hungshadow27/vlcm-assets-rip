package com.tgame.moudels.wedding.model
{
   import com.tgame.common.vo.character.info.data.PersonData;
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Wedding_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Attribute_MsgSenderProxy";
      
      public function Wedding_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_52201(param1:* = null) : void
      {
         ZLog.add("52201：发送个人资料查询消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52201,_loc2_);
      }
      
      public function send_52203(param1:* = null) : void
      {
         ZLog.add("52203：发送修改个人资料消息");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:PersonData = param1 as PersonData;
         _loc2_.writeUTF(_loc3_.nickName);
         _loc2_.writeShort(_loc3_.birthYear);
         _loc2_.writeShort(_loc3_.birthMoon);
         _loc2_.writeShort(_loc3_.birthDay);
         _loc2_.writeByte(_loc3_.sex);
         _loc2_.writeByte(_loc3_.blood);
         _loc2_.writeUTF(_loc3_.shengFen);
         _loc2_.writeUTF(_loc3_.city);
         _loc2_.writeUTF(_loc3_.job);
         _loc2_.writeUTF(_loc3_.school);
         _loc2_.writeUTF(_loc3_.mail);
         _loc2_.writeUTF(_loc3_.http);
         _loc2_.writeUTF(_loc3_.qq);
         _loc2_.writeUTF(_loc3_.phone);
         _loc2_.writeByte(_loc3_.openType);
         NetWorkManager.sendMsg(52203,_loc2_);
      }
      
      public function send_52205(param1:* = null) : void
      {
         ZLog.add("52205：发送其他玩家资料查询消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52205,_loc2_);
      }
      
      public function send_52207(param1:* = null) : void
      {
         ZLog.add("52207：发送个人资料列表分页查询消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(52207,_loc2_);
      }
      
      public function send_52009(param1:* = null) : void
      {
         ZLog.add("52009：发送检查自己是否填写完整消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52009,_loc2_);
      }
      
      public function send_52211(param1:* = null) : void
      {
         ZLog.add("52211：发送搜索个人资料消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52211,_loc2_);
      }
      
      public function send_52213(param1:* = null) : void
      {
         ZLog.add("52213：发送求婚界面显示消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52213,_loc2_);
      }
      
      public function send_52215(param1:* = null) : void
      {
         ZLog.add("52215：发送放入玉佩消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52215,_loc2_);
      }
      
      public function send_52217(param1:* = null) : void
      {
         ZLog.add("52217：发送购买玉佩列表消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52217,_loc2_);
      }
      
      public function send_52261(param1:* = null) : void
      {
         ZLog.add("52261：发送购买玉佩列表消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52261,_loc2_);
      }
      
      public function send_52219(param1:* = null) : void
      {
         ZLog.add("52219：发送购买玉佩消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52219,_loc2_);
      }
      
      public function send_52221(param1:* = null) : void
      {
         ZLog.add("52221：发送求婚消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(52221,_loc2_);
      }
      
      public function send_52225(param1:* = null) : void
      {
         ZLog.add("52225：发送被求婚者点开求婚面板消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52225,_loc2_);
      }
      
      public function send_52227(param1:* = null) : void
      {
         ZLog.add("52227：发送是否同意求婚消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(52227,_loc2_);
      }
      
      public function send_52231(param1:* = null) : void
      {
         ZLog.add("52231：发送检查是否可以新增耳语消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52231,_loc2_);
      }
      
      public function send_52233(param1:* = null) : void
      {
         ZLog.add("52233：发送新增耳语消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(52233,_loc2_);
      }
      
      public function send_52235(param1:* = null) : void
      {
         ZLog.add("52235：发送删除耳语消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52235,_loc2_);
      }
      
      public function send_52237(param1:* = null) : void
      {
         ZLog.add("52237：发送打开玉佩更换界面消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52237,_loc2_);
      }
      
      public function send_52239(param1:* = null) : void
      {
         ZLog.add("52239：发送放入高级定情玉佩消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52239,_loc2_);
      }
      
      public function send_52301(param1:* = null) : void
      {
         ZLog.add("52301：发送配偶属性消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52301,_loc2_);
      }
      
      public function send_52303(param1:* = null) : void
      {
         ZLog.add("52303：发送第一次请求耳语全部内容消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52303,_loc2_);
      }
      
      public function send_52241(param1:* = null) : void
      {
         ZLog.add("52241：发送开始更换玉佩消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52241,_loc2_);
      }
      
      public function send_52243(param1:* = null) : void
      {
         ZLog.add("52243：发送取回原配玉佩消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52243,_loc2_);
      }
      
      public function send_52305(param1:* = null) : void
      {
         ZLog.add("52305：发送离婚请求消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(52305,_loc2_);
      }
      
      public function send_52309(param1:* = null) : void
      {
         ZLog.add("52309：发送是否同意协议离婚消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(52309,_loc2_);
      }
      
      public function send_52361(param1:* = null) : void
      {
         ZLog.add("52361：发送请求TA的武功界面消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52361,_loc2_);
      }
      
      public function send_52371(param1:* = null) : void
      {
         ZLog.add("52371：发送动TA一下消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52371,_loc2_);
      }
      
      public function send_61033(param1:* = null) : void
      {
         ZLog.add("61033：分手后取回一半对剑");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61033,_loc2_);
      }
      
      public function send_52357(param1:* = null) : void
      {
         ZLog.add("52357：离婚后取回物品");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52357,_loc2_);
      }
   }
}

