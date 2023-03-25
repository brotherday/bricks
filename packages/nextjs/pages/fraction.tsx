import React from 'react'
import { useDisclosure } from '@chakra-ui/react'
import {
  Button,
  Modal,
  ModalOverlay,
  ModalContent,
  ModalHeader,
  ModalFooter,
  ModalBody,
  ModalCloseButton,
} from '@chakra-ui/react'
function fraction() {
  const { isOpen, onOpen, onClose } = useDisclosure()
  return (
    <>
      <div className="flex items-center flex-col flex-grow justify-center">
        <Button colorScheme="blue" size-lg onClick={onOpen}>Fraction</Button>
        <Modal isOpen={isOpen} onClose={onClose}>
          <ModalOverlay />
          <ModalContent>
            <ModalHeader>Burn</ModalHeader>
            <ModalCloseButton />
            <ModalFooter>
              <Button colorScheme="blue" mr={3} onClick={onClose}>
                No
              </Button>
              <Button variant='ghost'>Yes</Button>
            </ModalFooter>
          </ModalContent>
        </Modal>
      </div>
    </>
  )
}

export default fraction
