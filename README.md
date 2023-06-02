
The admin side:

The admin side is used to create store pages, edit their categories and  items. create a user and assign them to store
Each store will have its own categories and item.
Each store will its own users.
Admin can create/update and delete stores
Admin can create/update and delete users
Admin can assign more than 1 store to a user.


Store-front side

shows the categories in form of cards
shows items in those categories upon hover
item are addable to a cart
cart checkout will require a customer email and credit card to checkout.
credit card will be verified first before completing the checkout process.
each order will be stored in the database againnt that store. (example an order something like this: a customer abc bought x, y and z item in this store 1 on this date-time). This is similar to any receipt we receive if we do shopping from a store with a proper system.
if the checkout process was not completed then the state of that cart is saved and will on the same state if the user re logn-in.
After the checkout os complete a reciept email is sent to customer email address automatically
There is no signup page only login for now. The login page is same for all users, the system should determine itself wether the user is admin or the normal user and direct to respective page accordingly