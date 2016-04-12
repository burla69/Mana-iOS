//
//  MessagesViewController.m
//  Mana-iOS
//
//  Created by Oleksandr Burla on 4/12/16.
//  Copyright © 2016 DB2. All rights reserved.
//

#import "MessagesViewController.h"
#import <JSQMessages.h>
#import "UIColor+CustomColors.h"
#import "AppDelegate.h"



@interface MessagesViewController () <JSQMessagesCollectionViewDataSource, UIActionSheetDelegate, JSQMessagesComposerTextViewPasteDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) NSMutableArray *messages;
@property (strong, nonatomic) JSQMessagesBubbleImage *outgoinImage;
@property (strong, nonatomic) JSQMessagesBubbleImage *incomingImage;

@property (strong, nonatomic) UIImagePickerController *imagePicker;


@end

@implementation MessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareUI];
    [self setupBubbles];
    // Do any additional setup after loading the view.
    
    self.inputToolbar.contentView.textView.pasteDelegate = self;
    
}


-(void) testMessatesWithText:(NSString*)text {
    JSQMessage *message = [[JSQMessage alloc] initWithSenderId:@"3"
                                             senderDisplayName:@"Alex Burla"
                                                          date:[NSDate date]
                                                          text:text];
    
    
    
    [self.messages addObject:message];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareUI {
    self.title = @"Chat";
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //self.collectionView.collectionViewLayout.incomingAvatarViewSize;
    self.collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero;
    
    self.inputToolbar.maximumHeight = self.view.frame.size.height / 4.;
    //self.inputToolbar.contentView.leftBarButtonItem = nil;
    self.inputToolbar.barTintColor = [UIColor whiteColor];
    [self.inputToolbar.contentView.rightBarButtonItem setTitleColor:[UIColor blueColorMy] forState:UIControlStateNormal];
    //self.inputToolbar.contentView.tintColor = [UIColor skyBlueColor];
}

- (void)setupBubbles {
    JSQMessagesBubbleImageFactory *factory = [[JSQMessagesBubbleImageFactory alloc] init];
    self.outgoinImage = [factory outgoingMessagesBubbleImageWithColor:[UIColor skyBlueColorMy]];
    self.incomingImage = [factory incomingMessagesBubbleImageWithColor:[UIColor greyColorMy]];
}

- (void)addMessageWithSenderID:(NSString *)senderID text:(NSString *)text  {
    JSQMessage *message = [JSQMessage messageWithSenderId:senderID displayName:@"" text:text];
    
    [self.messages addObject:message];
}


#pragma mark - JSQMessagesCollectionViewDataSource

- (id<JSQMessageData>)collectionView:(JSQMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.messages[indexPath.item];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.messages.count;
}



- (id<JSQMessageBubbleImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView messageBubbleImageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSQMessage *message = self.messages[indexPath.item];
    if ([message.senderId isEqualToString:self.senderId ]) {
        return self.outgoinImage;
    } else {
        return self.incomingImage;
    }
}

- (id<JSQMessageAvatarImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView avatarImageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    JSQMessage *message = self.messages[indexPath.item];
    if (![message.senderId isEqualToString:self.senderId ]) {
        JSQMessagesAvatarImage *image = [JSQMessagesAvatarImageFactory avatarImageWithImage:self.userImage
                                                                                   diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        return image;
    }
    
    return nil;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSLog(@"new message");
    
    JSQMessagesCollectionViewCell *cell = (JSQMessagesCollectionViewCell *)[super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    
    JSQMessage *message = self.messages[indexPath.item];
    
    if ([message.senderId isEqualToString:self.senderId ]) {
        cell.textView.textColor = [UIColor whiteColor];
    } else {
        cell.textView.textColor = [UIColor blackColor];
    }
    
    return cell;
}



#pragma mark - JSQMessagesViewController method overrides

- (void)didPressSendButton:(UIButton *)button
           withMessageText:(NSString *)text
                  senderId:(NSString *)senderId
         senderDisplayName:(NSString *)senderDisplayName
                      date:(NSDate *)date
{

    [JSQSystemSoundPlayer jsq_playMessageSentSound];
    
    JSQMessage *message = [[JSQMessage alloc] initWithSenderId:senderId
                                             senderDisplayName:senderDisplayName
                                                          date:date
                                                          text:text];
    
    [self.messages addObject:message];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self testMessatesWithText:text];
        [self finishSendingMessageAnimated:YES];
    });
    
    
//    [outgoingMessage addHeaderWithValue:self.senderUsername key:@"username"];
//    [outgoingMessage addHeaderWithValue:self.senderAvatarURL key:@"avatar"];
    [self finishSendingMessageAnimated:YES];
}


//- (void)didPressAccessoryButton:(UIButton *)sender
//{
//    [self.inputToolbar.contentView.textView resignFirstResponder];
//    
//    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Media messages"
//                                                       delegate:self
//                                              cancelButtonTitle:@"Cancel"
//                                         destructiveButtonTitle:nil
//                                              otherButtonTitles:@"Send photo", @"Send location", @"Send video", nil];
//    
//    [sheet showFromToolbar:self.inputToolbar];
//}

///////////////////////////////////////////////////////////
- (void)didPressAccessoryButton:(UIButton *)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Choose type" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction *chooseExisting = [UIAlertAction actionWithTitle:@"Choose Existing Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [weakSelf presentViewController:self.imagePicker animated:YES completion:nil];

    }];
    
    UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"Take Photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [weakSelf presentViewController:self.imagePicker animated:YES completion:nil];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //[weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:chooseExisting];
    [alertController addAction:takePhoto];
    [alertController addAction:cancel];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


- (UIImagePickerController *)imagePicker {
    if (_imagePicker == nil) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
        _imagePicker.allowsEditing = YES;
    }
    
    return _imagePicker;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    JSQPhotoMediaItem *photoItem = [[JSQPhotoMediaItem alloc] initWithImage:image];
    JSQMessage *photoMessage = [JSQMessage messageWithSenderId:self.senderId
                                                   displayName:self.senderDisplayName
                                                         media:photoItem];
    [self.messages addObject:photoMessage];
    [self finishSendingMessage];

    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



/////////////////////////////////////////////////////////////




#pragma mark - Initialization

- (NSMutableArray *)messages {
    if (_messages == nil) {
        _messages = [[NSMutableArray alloc] init];
    }
    
    return _messages;
}


#pragma mark - JSQMessagesComposerTextViewPasteDelegate methods


- (BOOL)composerTextView:(JSQMessagesComposerTextView *)textView shouldPasteWithSender:(id)sender
{
    
    NSLog(@"shouldPasteWithSender");
    if ([UIPasteboard generalPasteboard].image) {
        // If there's an image in the pasteboard, construct a media item with that image and `send` it.
        JSQPhotoMediaItem *item = [[JSQPhotoMediaItem alloc] initWithImage:[UIPasteboard generalPasteboard].image];
        JSQMessage *message = [[JSQMessage alloc] initWithSenderId:self.senderId
                                                 senderDisplayName:self.senderDisplayName
                                                              date:[NSDate date]
                                                             media:item];
        [self.messages addObject:message];
        [self finishSendingMessage];
        return NO;
    }
    return YES;
}


- (void)collectionView:(JSQMessagesCollectionView *)collectionView didTapMessageBubbleAtIndexPath:(NSIndexPath *)indexPath
{
    JSQMessage *message = [self.messages objectAtIndex:indexPath.row];
    
    if (message.isMediaMessage) {
        id<JSQMessageMediaData> mediaItem = message.media;
        
        if ([mediaItem isKindOfClass:[JSQPhotoMediaItem class]]) {
            
            NSLog(@"Tapped photo message bubble!");
            
            JSQPhotoMediaItem *photoItem = (JSQPhotoMediaItem *)mediaItem;
            [self popupImage:photoItem.image];
        }
    }
}

- (void) popupImage: (UIImage*)image
{
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];

    imageView.frame = self.view.frame;
    
    [self.view addSubview:imageView];
    
//    zoomPopup  *popup = [[zoomPopup alloc] initWithMainview:topView andStartRect:CGRectMake(topView.frame.size.width/2, topView.frame.size.height/2, 0, 0)];
//    [popup showPopup:imageView];
}





@end
